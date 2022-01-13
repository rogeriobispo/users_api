# frozen_string_literal: true

require 'rails_helper'

describe Users::SearchService do
  subject(:service) { described_class.perform(term) }

  let(:user1) { create(:user, email: 'teste@teste.com') }
  let(:user2) { create(:user, metadata: 'rogerio_bispo: masc musician') }
  let(:user3) { create(:user, full_name: 'Rogerio dos santos bispo') }

  context 'when find by email' do
    let(:term) { 'teste@teste.com' }

    it { expect(service.users).to eq([user1]) }
  end

  context 'when find by metada' do
    let(:term) { 'musician' }

    it { expect(service.users).to eq([user2]) }
  end

  context 'when success first_name' do
    let(:term) { 'Rogerio' }

    it { expect(service.users).to eq([user3]) }
  end

  context 'when return all' do
    let(:term) { nil }

    it { expect(service.users).to eq([user1, user2, user3]) }
  end
end
