require 'rails_helper'

RSpec.describe 'Cnabs', type: :request do

  describe 'GET index' do
    let(:store) { build(:store) }
    let(:store_id) { store.id }
    let!(:cnab1) { create(:cnab, store: store) }
    let!(:cnab2) { create(:cnab, store: store) }

    before { get '/cnabs', params: { store_id: store_id } }

    it { expect(response).to have_http_status(:success) }
    it { expect(response.body).to eq([cnab1, cnab2]) }

    context 'when not fount store' do
      let(:store_id) { 'some-inexistent-id' }

      it { expect(response).to have_http_status(:error) }
      it { expect(response.body).to eq('Loja não encontrada') }
    end
  end

  describe 'POST create' do
    let!(:cnab_attributes) { attributes_for(:cnab) }

    before { post '/cnabs', params: { cnab_attributes: cnab_attributes } }

    it { expect(response).to have_http_status(:success) }
    it { expect(Cnab.count).to eq(1) }
    it { expect(Cnab.first.attributes).to include(cnab_attributes) }
  end
end
