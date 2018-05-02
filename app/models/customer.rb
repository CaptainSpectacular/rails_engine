class Customer < ApplicationRecord
  has_many :invoices

  def self.random
    order('random()').limit(1)
  end
end
