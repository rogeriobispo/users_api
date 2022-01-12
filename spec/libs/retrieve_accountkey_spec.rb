# frozen_string_literal: true

require 'rails_helper'

describe RetrieveAccountkey do
  let(:retrieve_saccount_key) { described_class.new.perform(email, key) }
  let(:key) { 'key' }
  let(:email) { 'user@example.com' }
  let(:expected_response) { { email: 'user@example.com', account_key: 'b97df97988a3832f009e2f18663ac932' } }
  let(:mock_response) do
    {
      parsed_response: {
        email: 'user@example.com',
        account_key: 'b97df97988a3832f009e2f18663ac932'
      }
    }.to_dot
  end

  before do
    allow(HTTParty).to receive(:post).and_return(mock_response)
  end

  it 'returns the account key' do
    expect(retrieve_saccount_key).to eq(expected_response)
  end

  context 'when the account_key is not found' do
    let(:mock_response) { { parsed_response: { email: nil, account_key: nil } }.to_dot }
    let(:expected_response) { { email: nil, account_key: nil } }

    it 'returns the account key' do
      expect(retrieve_saccount_key).to eq(expected_response)
    end
  end
end
