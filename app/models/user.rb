# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(15)
#  last_sign_in_ip        :string(15)
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string
#  locked_at              :datetime
#  username               :string(70)
#  role                   :integer
#  first_name             :string(100)
#  last_name              :string(100)
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
  enum role: { superuser: 0, staff: 1, user: 2, visitor: 3 }

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

  # == Relationships ==================================

  # == Validations ====================================
  # minimum length of 5 to match: a@a.a
  validates :email, presence: true, 'valid_email_2/email': { disposable: false }, length: { minimum: 5, maximum: 255 }, uniqueness: { case_sensitive: false }, allow_nil: false
  validates :role, presence: true, inclusion: { in: roles.keys }, allow_nil: false
  validates :first_name, :last_name, length: { minimum: 1, maximum: 100 }

  # == Scopes =========================================

  # == Callbacks ======================================
  # Before any validations ensure a default role is set
  before_validation do
    self.role ||= :user
  end

  # == ClassMethods ===================================
  # If the current_user has the specified role
  #
  # @return [Boolean]
  def admin?
    role?(:superuser)
  end

  # If the current_user has the specified role
  #
  # @return [Boolean]
  def staff?
    role?(:staff)
  end

  # If the current_user has a superuser or staff role
  #
  # @return [Boolean]
  def staff_member?
    role?(:superuser) || role?(:staff)
  end

  # If the current_user has the specified role
  #
  # @parram role [String, Symbol]
  # @return [Boolean]
  def role?(role)
    self.role == role.to_s
  end

  # == InstanceMethods ================================
end
