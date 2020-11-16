# frozen_string_literal: true

FactoryBot.define do
  factory :cnab do
    occurence_at { Time.zone.now }
    value { 10.0 }
    cpf { Faker::CPF.number }
    card_number { Faker::Finance.credit_card(:mastercard) }
    store { build(:store) }
    cnab_type { build(:cnab_type, :inflow) }
  end
end
