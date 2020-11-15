require 'rails_helper'

RSpec.describe CnabType, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:number) }
    it { is_expected.to validate_inclusion_of(:nature).in_array(%w[inflow outflow]) }
  end

  describe '#inflow? and #outflow' do
    let(:inflow) { build(:cnab_type, :inflow) }
    let(:outflow) { build(:cnab_type, :outflow) }

    it { expect(inflow.inflow?).to be_truthy }
    it { expect(inflow.outflow?).to be_falsey }
    it { expect(outflow.inflow?).to be_falsey }
    it { expect(outflow.outflow?).to be_truthy }
  end

end
