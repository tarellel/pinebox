# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(15)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string(100)
#  last_name              :string(100)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(15)
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  sign_in_count          :integer          default(0), not null
#  unlock_token           :string
#  username               :string(70)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  # == Attributes =====================================
  # enum role: { superuser: 0, staff: 1, user: 2, visitor: 3 }

  # == Concerns =======================================

  # == Constants ======================================

  # == Extensions =====================================
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :secure_validatable,
         :lockable, :timeoutable, :trackable,
         email_validation: false # Since we are using valid_email validator for a stricter email validator
  # https://github.com/micke/valid_email2/issues/121
  auto_strip_attributes :first_name, :last_name, squish: true
  has_person_name
  rolify # For managing user rolws

  # == Relationships ==================================

  # == Validations ====================================
  # minimum length of 5 to match: a@a.a
  validates :email, presence: true, 'valid_email_2/email': { disposable: false }, length: { minimum: 5, maximum: 255 }, uniqueness: { case_sensitive: false }, allow_nil: false
  validates :first_name, :last_name, length: { minimum: 1, maximum: 100 }

  # == Scopes =========================================

  # == Callbacks ======================================
  after_create :assign_default_role

  # == ClassMethods ===================================
  # If the current_user has the specified role
  #
  # @return [Boolean]
  def admin?
    @_admin ||= defined?(@_admin) ? @_admin : has_role?(:admin)
  end

  # If the current_user has the specified role
  #
  # @return [Boolean]
  def staff?
    @_staff ||= defined?(@_staff) ? @_staff : has_role?(:staff)
  end

  # If the current_user has a superuser or staff role
  #
  # @return [Boolean]
  def staff_member?
    admin? || staff?
  end

  def user?
    @_user || has_role?(:user)
  end

  # If the current_user has the specified role
  #
  # @parram role [String, Symbol]
  # @return [Boolean]
  def role?(role)
    has_role?(role)
  end

  # == InstanceMethods ================================
  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
