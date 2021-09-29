# frozen_string_literal: true

class RolifyCreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name
      t.string :resource_type
      t.uuid :resource_id
      # t.references :resource, polymorphic: true


      t.timestamps
    end

    create_table :users_roles, id: false do |t|
      # t.references :user
      # t.references :role
      t.uuid :user_id, index: true
      t.uuid :role_id, index: true
    end

    add_index :roles, [:name, :resource_type, :resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    add_index :roles, [:resource_type, :resource_id], name: 'index_roles_on_resource'
    add_index :users_roles, [:user_id, :role_id]
  end
end
