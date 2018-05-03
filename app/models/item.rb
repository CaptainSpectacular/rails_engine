class Item < ApplicationRecord
  belongs_to :merchant, optional: true
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue(number_of_entries)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(:invoice_items, :invoices, :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .order("revenue DESC")
    .limit(number_of_entries)
  end

  def best_day
    invoices
      .select('invoices.updated_at, SUM(invoice_items.quantity * invoice_items.unit_price) AS answer')
      .joins(:transactions, :invoice_items)
      .group('invoices.updated_at')
      .where(transactions: {result: 'success'})
      .order('answer DESC')
      .first
  end

  def self.most_sold(limit = 5)
    select('items.*, SUM(invoice_items.quantity) AS sold')
      .joins(:invoice_items)
      .group('items.id')
      .order('sold DESC')
      .limit(limit)
  end
end
