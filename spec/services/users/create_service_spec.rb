# frozen_string_literal: true

require 'rails_helper'

describe Users::CreateService do
  subject(:service) { described_class.perform(params) }

  let(:params) do
    {
      email: 'user@example.com',
      phone_number: '5551235555',
      full_name: 'Joe Smith',
      password: 'password',
      metadata: 'male, age 32, unemployed, college-educated'
    }
  end

  context 'when success' do
    it { expect(service).to be_success }
    it { expect(service.user).to eq(User.last) }
  end

  context 'when failure' do
    let(:params) { { email: 'teste@teste.com' } }

    it { expect(service).to be_failure }
    it { expect(service.errors).to eq(["Phone number can't be blank", "Password can't be blank"]) }
  end
end
