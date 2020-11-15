require 'rails_helper'

RSpec.describe "Stores", type: :request do

  describe "GET /index" do
    let!(:store1) { create(:store) }
    let!(:store2) { create(:store) }
    let(:json) { JSON.parse(response.body) }

    before do
      get "/stores"
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(json.count).to eq(2) }
    it { expect(json.first).to include(store1.attributes.reject{ |key, value| ['created_at', 'updated_at'].include?(key) }) }
    it { expect(json.second).to include(store2.attributes.reject{ |key, value| ['created_at', 'updated_at'].include?(key) }) }
  end
end
