# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :phone_number, :key, presence: true
  validates :email, :phone_number, :key, :account_key, uniqueness: true
  validates :metadata, length: { maximum: 2000 }
  validates :phone_number, length: { maximum: 20 }
  validates :email, :full_name, length: { maximum: 200 }
  validates :password, :key, :account_key, length: { maximum: 100 }

  has_secure_password
end
