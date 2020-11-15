require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:cnabs).inverse_of(:store) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:agent) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "#find_by_name_or_create" do
    let(:name) { 'some_name' }
    let(:agent) { 'some_agent' }

    it { expect { Store.find_by_name_or_create(name, agent) }.to change { Store.count }.from(0).to(1) }

    context 'when founds a Store' do
      before { create(:store, name: name, agent: agent) }

      it { expect { Store.find_by_name_or_create(name, agent) }.not_to change { Store.count } }
      it { expect(Store.find_by_name_or_create(name, agent)).to eq(Store.find_by(name: name)) }
    end
  end

  describe '#total_balance' do
    let(:inflow) { build(:cnab_type, :inflow) }
    let(:outflow) { build(:cnab_type, :outflow) }
    let(:cnab_inflow) { build(:cnab, value: 10, cnab_type: inflow) }
    let(:cnab_outflow) { build(:cnab, value: 8, cnab_type: outflow) }
    let(:store) { build(:store, cnabs: [cnab_inflow, cnab_outflow]) }

    it { expect(store.total_balance).to eq(2) }
  end
end
