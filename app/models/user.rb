# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :phone_number, :password, :key, presence: true
  validates :email, :phone_number, :key, :account_key, uniqueness: true
end
