class Merchant < ApplicationRecord
  validates :name, presence: true

  def self.random
    order('random()').limit(1)
  end
end
