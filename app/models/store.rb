class Store < ApplicationRecord
  has_many :cnabs, inverse_of: :store

  validates_presence_of :name, :agent
  validates_uniqueness_of :name

  def self.find_by_name_or_create(name, agent)
    Store.find_by!(name: name)
  rescue ActiveRecord::RecordNotFound
    Store.create(name: name, agent: agent)
  end
end
