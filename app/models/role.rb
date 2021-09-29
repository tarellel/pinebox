# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id            :uuid             not null, primary key
#  name          :string
#  resource_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resource_id   :uuid
#
# Indexes
#
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id)
#  index_roles_on_resource                                (resource_type,resource_id)
#
class Role < ApplicationRecord
  # == Attributes =====================================

  # == Concerns =======================================

  # == Constants ======================================

  # == Extensions =====================================
  scopify

  # == Relationships =================================
  belongs_to :resource, polymorphic: true, optional: true
  has_and_belongs_to_many :users, join_table: :users_roles

  # == Validations ====================================
  validates :resource_type, inclusion: { in: Rolify.resource_types }, allow_nil: true

  # == Scopes =========================================

  # == Callbacks ======================================

  # == ClassMethods ===================================

  # == InstanceMethods ================================
end
