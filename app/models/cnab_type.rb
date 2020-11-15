class CnabType < ApplicationRecord
  validates_uniqueness_of :number
  validates :nature, inclusion: { in: %w[inflow outflow] }

  def to_json
    {
      number: number,
      description: description,
      nature: nature
    }
  end
end
