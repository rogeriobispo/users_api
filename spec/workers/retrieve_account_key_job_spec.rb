# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RetrieveAccountKeyJob, type: :worker do
  subject(:account_key_worker) { described_class.new.perform(user.id) }

  let(:retrieve_account_key) { RetrieveAccountkey.new }
  let(:account_key_response) { { email: 'user@example.com', account_key: 'b97df97988a3832f009e2f18663ac932' } }

  before do
    allow(RetrieveAccountkey).to receive(:new).and_return(retrieve_account_key)
    allow(retrieve_account_key).to receive(:perform).and_return(account_key_response)
  end

  describe '#perform_later' do
    let(:user) { create(:user) }

    it 'queues the job' do
      account_key_worker
      expect(retrieve_account_key).to have_received(:perform).with(user.email, user.key)
    end

    it 'updates the user account_key' do
      account_key_worker
      expect(user.reload.account_key).to eq(account_key_response[:account_key])
    end
  end
end
