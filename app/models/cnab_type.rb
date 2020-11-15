class CnabType < ApplicationRecord
  validates_uniqueness_of :number
  validates :nature, inclusion: { in: %w[inflow outflow] }

  def inflow?
    nature == 'inflow'
  end

  def outflow?
    nature == 'outflow'
  end
end
