class CnabType < ApplicationRecord
  validates_uniqueness_of :number
  validates :nature, inclusion: { in: %w[inflow outflow] }
end
