# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w[user staff superuser admin].each do |role|
  Role.create!(name: role)
end

user = User.create!(email: 'test@test.com', password: 'Pa$$w0rd!', password_confirmation: 'Pa$$w0rd!', name: 'Michael Scott')
user.add_role(:admin)

User.create!(email: 'test2@test.com', password: 'Pa$$w0rd!', password_confirmation: 'Pa$$w0rd!', name: 'Dwight Schrute')
User.create!(email: 'test_user@test.com', password: 'P4ssW0rd!', password_confirmation: 'P4ssW0rd!', name: 'Jim Halpert')
