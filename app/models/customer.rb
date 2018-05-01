class Customer < ApplicationRecord
  def self.random
    order('random()').limit(1)
  end
end
