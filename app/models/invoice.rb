class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer, optional: true
  belongs_to :merchant, optional: true

  # def self.most_expensive(limit = 5, filter = {})
  #   select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
  #   .joins(:invoice_items, :transactions)
  #   .merge(Transaction.successful) //// scope :successful, -> { where(result: 'success') }
  #   .where(filter)
  #   .group(:id)
  #   .order("revenue DESC")
  #   .limit(5)
  # end
end
