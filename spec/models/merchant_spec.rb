require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it 'must have name' do
      merchant = Merchant.create(name: 'Sunv')
      not_a_merchant = Merchant.create()

      expect(merchant).to be_valid
      expect(not_a_merchant).to_not be_valid
    end
  end

  describe 'relationships' do
    it { should have_many(:items) }
    it { should have_many(:invoices) }
    it { should have_many(:customers) }
    it { should have_many(:invoice_items) }
    it { should have_many(:transactions) }
  end

  describe 'instance methods' do
    it '#favorite_customer' do
      merchant = create(:merchant)
      c1, c2 = create_list(:customer, 2)
      c1_invoice  = create(:invoice, merchant: merchant, customer: c1)
      c2_invoice1 = create(:invoice, merchant: merchant, customer: c2) 
      c2_invoice2 = create(:invoice, merchant: merchant, customer: c2) 
      create(:transaction, invoice: c1_invoice)
      create(:transaction, invoice: c2_invoice1)
      create(:transaction, invoice: c2_invoice2)

      expect(merchant.favorite_customer).to eq(c2)
    end

    it '#revenue' do
      m1, m2    = create_list(:merchant, 2)
      c1, c2    = create_list(:customer, 2)
      item1     = create(:item, merchant: m1)
      item2     = create(:item, merchant: m2)
      invoice1  = create(:invoice, merchant: m1, customer: c1)
      invoice2  = create(:invoice, merchant: m2, customer: c2)
      create(:invoice, merchant: m2, customer: c2) 
      create(:invoice, merchant: m2, customer: c2) 
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:invoice_item, invoice: invoice1, item: item1)
      create(:invoice_item, invoice: invoice2, item: item2)

      expect(m1.revenue.to_f).to eq(1359.9)
      expect(m2.revenue.to_f).to eq(679.95)
    end
  end

  describe 'class methods' do
    it '.most_revenue' do
      m1, m2    = create_list(:merchant, 2)
      c1, c2    = create_list(:customer, 2)
      item1     = create(:item, merchant: m1)
      item2     = create(:item, merchant: m2)
      invoice1  = create(:invoice, merchant: m1, customer: c1)
      invoice2  = create(:invoice, merchant: m2, customer: c2)
      create(:invoice, merchant: m2, customer: c2) 
      create(:invoice, merchant: m2, customer: c2) 
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:invoice_item, invoice: invoice1, item: item1)
      create(:invoice_item, invoice: invoice2, item: item2)

      expect(Merchant.most_revenue).to eq([m1, m2])
      expect(Merchant.most_revenue(1)).to eq([m1])
    end
  end
end
