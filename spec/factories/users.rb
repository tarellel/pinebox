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

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    role { :user }
    username { Faker::Internet.username }
    password { 'Pa$$w0rd!' }
    password_confirmation { 'Pa$$w0rd!' }
    # password { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: true) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
