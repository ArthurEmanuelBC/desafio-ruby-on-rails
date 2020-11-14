require 'rails_helper'

RSpec.describe CnabType, type: :model do
  describe 'validations' do
    it { should belong_to(:cnab) }
    it { should validate_uniqueness_of(:type) }
    it { should validate_inclusion_of(:active).in_array(%w[inflow outflow]) }
  end

end
