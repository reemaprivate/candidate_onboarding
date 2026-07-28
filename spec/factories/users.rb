# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'Password@123' }
    password_confirmation { password }

    role { :candidate }
  end
end
