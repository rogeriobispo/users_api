# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    described_class.new(email: 't@t.com', phone_number: '1234567890', password: '12345678', key: '1234567890')
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }
    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_uniqueness_of(:key).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:account_key) }
  end

  context 'with encrypted password' do
    it 'encrypts password' do
      expect(user.password_digest).not_to eq('12345678')
    end
  end
end
