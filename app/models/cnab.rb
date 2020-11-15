class Cnab < ApplicationRecord
  belongs_to :cnab_type
  belongs_to :store

  validates_presence_of :occurence_at, :value, :cpf, :card_number

  delegate :inflow?, :outflow?, to: :cnab_type
end
