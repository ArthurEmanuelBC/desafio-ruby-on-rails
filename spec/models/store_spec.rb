require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:cnabs).inverse_of(:store) }
  end
end
