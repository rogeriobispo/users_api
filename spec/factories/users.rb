# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'MyString' }
    phone_number { 'MyString' }
    full_name { 'MyString' }
    password { 'MyString' }
    key { 'MyString' }
    account_key { 'MyString' }
    metadata { 'MyString' }
  end
end
