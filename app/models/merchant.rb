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
    .first
  end

  def self.most_revenue(number_of_merchants)
    joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"})
    .group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .limit(number_of_merchants)
  end

  def revenue(date=nil)
    if date
       invoices.joins(:invoice_items, :transactions)
                .where(transactions: {result: 'success'})
                .where('DATE(invoices.created_at) = ?', [date])
                .sum('invoice_items.unit_price * invoice_items.quantity')
    else
      invoices.joins(:invoice_items, :transactions)
              .where(transactions: {result: 'success'})
              .sum('invoice_items.unit_price * invoice_items.quantity')
    end
  end

  def self.most_items(limit)
    select('merchants.*, SUM(invoice_items.quantity) AS business')
      .joins(invoices: [:invoice_items, :transactions])
      .where(transactions: {result: 'success'})
      .group('merchants.id')
      .order('business DESC')
      .limit(limit || 5)
  end

  def self.total_revenue_for_date(date)
    joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"})
    .where("DATE(invoices.created_at) = ?", date)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def customers_with_pending_invoices
    Customer.find_by_sql ["SELECT customers.* FROM merchants
      JOIN invoices ON merchants.id = invoices.merchant_id
      JOIN customers ON customers.id = invoices.customer_id
      JOIN transactions ON transactions.invoice_id = invoices.id
      WHERE merchants.id = #{id}
      EXCEPT SELECT customers.* FROM merchants
      JOIN invoices ON merchants.id = invoices.merchant_id
      JOIN customers ON customers.id = invoices.customer_id
      JOIN transactions ON transactions.invoice_id = invoices.id
      WHERE merchants.id = #{id} AND transactions.result = 'success';"]
  end
end
