# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Admin 1' }
    email { 'admin1@example.com' }
    password { '123456' }
  end
end
