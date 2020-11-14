require 'rails_helper'

RSpec.describe Cnab, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:occurence_at) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:card_number) }
  end
end
