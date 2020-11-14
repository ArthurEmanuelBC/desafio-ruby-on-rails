class CnabType < ApplicationRecord
  belongs_to :cnab

  validates_uniqueness_of :type
  validates :nature, inclusion: { in: %w[inflow outflow] }
end
