# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/users', type: :request do
  subject(:post_request) do
    post(
      '/api/users',
      params: params
    )
  end

  let(:params) do
    {
      email: 'user@example.com',
      phone_number: '5551235555',
      full_name: 'Joe Smith',
      password: 'password',
      metadata: 'male, age 32, unemployed, college-educated'
    }
  end

  before do
    allow(SecureRandom).to receive(:hex).and_return('b97df97988a3832f009e2f18663ac932')
    post_request
  end

  context 'when success' do
    it { expect(response.status).to eq(201) }
    it { expect(JSON.parse(response.body)['phone_number']).to eq('5551235555') }
    it { expect(JSON.parse(response.body)['email']).to eq('user@example.com') }
  end

  context 'when failure' do
    let(:params) { { email: 'teste@teste' } }
    let(:expected_response) do
      {
        'errors' => [
          "Phone number can't be blank",
          "Password can't be blank"
        ]
      }
    end

    it { expect(response.status).to eq(422) }
    it { expect(JSON.parse(response.body)).to eq(expected_response) }
  end
end
