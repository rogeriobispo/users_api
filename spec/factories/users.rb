# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    phone_number { FFaker::PhoneNumber.phone_number[0, 15] }
    full_name { FFaker::Name.unique.name }
    password { '123456' }
    key { SecureRandom.hex }
    account_key { SecureRandom.hex }
    metadata { FFaker::Name.name }
  end
end
