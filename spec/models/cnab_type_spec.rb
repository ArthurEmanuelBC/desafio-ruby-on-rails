require 'rails_helper'

RSpec.describe CnabType, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:number) }
    it { is_expected.to validate_inclusion_of(:nature).in_array(%w[inflow outflow]) }
  end
end
