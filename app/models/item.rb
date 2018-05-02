class Item < ApplicationRecord
  belongs_to :merchant
  has_many :transaction_items
  has_many :transactions, through: :transaction_items 
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(number_of_entries)

  end
end
