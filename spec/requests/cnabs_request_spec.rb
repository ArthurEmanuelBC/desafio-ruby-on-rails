require 'rails_helper'

RSpec.describe 'Cnabs', type: :request do

  describe 'GET index' do
    let!(:cnab1) { create(:cnab) }
    let!(:cnab2) { create(:cnab) }

    before { get '/cnabs' }

    it { expect(response).to have_http_status(:success) }
    it { expect(response.body).to eq([cnab1, cnab2]) }
  end

  describe 'POST create' do
    let!(:cnab_attributes) { attributes_for(:cnab) }

    before { post '/cnabs', params: { cnab_attributes: cnab_attributes } }

    it { expect(response).to have_http_status(:success) }
    it { expect(Cnab.count).to eq(1) }
    it { expect(Cnab.first.attributes).to include(cnab_attributes) }
  end
end
