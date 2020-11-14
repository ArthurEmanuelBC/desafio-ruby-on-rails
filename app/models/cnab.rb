class Cnab < ApplicationRecord
  has_many :cnab_types
  has_many :stores

  validate_presence_of :occurence_at, :value, :cpf, :card_number
end
