class Store < ApplicationRecord
  has_many :cnabs, inverse_of: :store
end
