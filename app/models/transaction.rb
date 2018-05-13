class Transaction < ApplicationRecord
  validates_presence_of :invoice_id,
                        :credit_card_number,
                        :result
  belongs_to :invoice
 
   def self.random
    order('random()').limit(1)
  end
end
