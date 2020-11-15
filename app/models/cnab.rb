class Cnab < ApplicationRecord
  belongs_to :cnab_type
  belongs_to :store

  validates_presence_of :occurence_at, :value, :cpf, :card_number

  def to_json
    {
      occurence_at: occurence_at,
      value: value,
      cpf: cpf,
      card_number: card_number,
      cnab_type: cnab_type,
      store: store
    }
  end
end
