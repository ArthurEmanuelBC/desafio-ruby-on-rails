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
    it { expect(response.body).to eq(store.cnabs.to_json(include: [:cnab_type, :store])) }

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
    it do
      expect(Cnab.first.attributes).to include({
        'occurence_at' => DateTime.parse('20190301145607'),
        'value' => BigDecimal.new(132),
        'cpf' => '55641815063',
        'card_number' => '3123****7687'
        # cnab_type: CnabType.find_by(number: '5'),
        # store: Store.find_by(name: 'MARIA JOSEFINA')
      })
    end
  end
end
