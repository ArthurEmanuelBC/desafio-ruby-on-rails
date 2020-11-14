FactoryBot.define do
  factory :cnab_type do
    number { (CnabType.count + 1).to_s }
    description { 'Débito' }
  end

  trait :inflow do
    nature { 'inflow' }
  end

  trait :outflow do
    nature { 'outflow' }
  end
end