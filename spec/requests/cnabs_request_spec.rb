# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cnabs', type: :request do
  describe 'GET index' do
    let(:store) { build(:store) }
    let(:store_id) { store.id }
    let!(:cnab1) { create(:cnab, store: store) }
    let!(:cnab2) { create(:cnab, store: store) }
    let!(:cnab3) { create(:cnab) }
    let(:json) { JSON.parse(response.body) }

    before { get '/cnabs', params: { store_id: store_id } }

    it { expect(response).to have_http_status(:success) }
    it { expect(json['cnabs']).to eq(store.cnabs.to_json(include: %i[cnab_type store])) }
    it { expect(json['total_balance']).to eq(store.total_balance.to_s) }

    context 'when not fount store' do
      let(:store_id) { 'some-inexistent-id' }

      it { expect(response).to have_http_status(:not_found) }
      it { expect(json).to eq({ 'message' => 'Loja não encontrada' }) }
    end
  end

  describe 'POST create' do
    let!(:file) { fixture_file_upload('files/CNAB.txt', 'text/txt') }

    before do
      create(:cnab_type, :inflow, number: '5')
      post '/cnabs', params: { cnab: { file: file } }
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(Cnab.count).to eq(1) }
    it { expect(Cnab.first.cnab_type).to eq(CnabType.find_by(number: '5')) }
    it { expect(Cnab.first.store).to eq(Store.find_by(name: 'LOJA DO Ó - MATRIZ')) }
    it do
      expect(Cnab.first.attributes).to include({
                                                 'occurence_at' => DateTime.parse('20190301145607'),
                                                 'value' => BigDecimal(132),
                                                 'cpf' => '55641815063',
                                                 'card_number' => '3123****7687'
                                               })
    end

    context 'when file params is wrong' do
      let!(:file) { 'is-not-a-file' }

      it { expect(response).to have_http_status(:internal_server_error) }
    end
  end
end
