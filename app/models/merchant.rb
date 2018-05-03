class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.random
    order('random()').limit(1)
  end

  def self.search(params)
    case
    when params[:id]         then Merchant.find(params[:id])
    when params[:name]       then Merchant.find_by(name: params[:name])
    when params[:created_at] then Merchant.find_by(created_at: params[:created_at])
    when params[:updated_at] then Merchant.find_by(updated_at: params[:updated_at])
    end
  end

  def self.search_all(params)
    case
    when params[:id]         then Merchant.where(id: params[:id])
    when params[:name]       then Merchant.where(name: params[:name])
    when params[:created_at] then Merchant.where(created_at: params[:created_at])
    when params[:updated_at] then Merchant.where(updated_at: params[:updated_at])
    end
  end

  def favorite_customer
    customers
    .select("customers.*, count(transactions.id) AS transaction_count")
    .joins(:invoices, :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .order("transaction_count DESC")
    .limit(1)
  end

  def self.most_revenue(number_of_merchants)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(:invoices, :invoice_items, :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .order("revenue DESC")
    .limit(number_of_merchants)
  end

  def revenue(date=nil)
    if date 
       invoices.joins(:invoice_items, :transactions)
                .where(transactions: {result: 'success'}, invoice_items: { created_at: date })
                .sum('invoice_items.unit_price * invoice_items.quantity')
    else
      invoices.joins(:invoice_items, :transactions)
              .where(transactions: {result: 'success'})
              .sum('invoice_items.unit_price * invoice_items.quantity')
    end
  end

  def self.total_revenue_for_date(date)
    select("sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(:invoices, :transactions, :invoice_items)
    .where(transactions: {result: "success"})
    .where(invoice_items: {created_at: "#{date}"})
  end
end
