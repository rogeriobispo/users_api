# frozen_string_literal: true

require 'rails_helper'

describe 'GET /api/users', type: :request do
  subject(:get_request) do
    get(
      "/api/users?q=#{term}"
    )
  end

  let(:user1) { create(:user, email: 'teste@teste.com') }
  let(:user2) { create(:user, metadata: 'meta: masc musician') }
  let(:user3) { create(:user, full_name: 'Rogerio dos santos bispo') }
  let(:term) { nil }

  before do
    user1
    user2
    user3
    get_request
  end

  it { expect(response.status).to eq(200) }

  context 'when find by email' do
    let(:term) { 'teste@teste.com' }

    it { expect(JSON.parse(response.body)['users'].count).to eq(1) }
  end

  context 'when find by metada' do
    let(:term) { 'musician' }

    it { expect(JSON.parse(response.body)['users'].count).to eq(1) }
  end

  context 'when success first_name' do
    let(:term) { 'Rogerio' }

    it { expect(JSON.parse(response.body)['users'].count).to eq(1) }
  end

  context 'when return all' do
    let(:term) { nil }

    it { expect(JSON.parse(response.body)['users'].count).to eq(3) }
  end
end
