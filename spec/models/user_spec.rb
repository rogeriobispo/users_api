# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    described_class.new(email: 't@t.com', phone_number: '1234567890', password: '12345678', key: '1234567890')
  end

  context 'with validations presence_of' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:key) }
  end

  context 'with validation uniqueness_of' do
    it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:key).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:account_key) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context 'with validation max filed size' do
    it { is_expected.to validate_length_of(:email).is_at_most(200) }
    it { is_expected.to validate_length_of(:phone_number).is_at_most(20) }
    it { is_expected.to validate_length_of(:full_name).is_at_most(200) }
    it { is_expected.to validate_length_of(:password).is_at_most(100) }
    it { is_expected.to validate_length_of(:key).is_at_most(100) }
    it { is_expected.to validate_length_of(:account_key).is_at_most(100) }
    it { is_expected.to validate_length_of(:metadata).is_at_most(2000) }
  end

  context 'with encrypted password' do
    it 'encrypts password' do
      expect(user.password_digest).not_to eq('12345678')
    end
  end
end
