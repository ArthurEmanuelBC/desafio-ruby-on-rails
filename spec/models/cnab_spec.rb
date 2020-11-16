# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cnab, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:cnab_type) }
    it { is_expected.to belong_to(:store) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:occurence_at) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:card_number) }
  end
end
