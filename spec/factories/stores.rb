FactoryBot.define do
  factory :store do
    name { Faker::Company.name }
    agent { Faker::Name.name }
  end
end