require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:merchant) }
    it { is_expected.to have_many(:invoice_items) }    
    it { is_expected.to have_many(:invoices) }    
    it { is_expected.to have_many(:transactions) }    
  end

  describe 'instance methods ' do
    it '#best_day' do
      merchant = create(:merchant)
      customer = create(:customer)      
      item     = create(:item, merchant: merchant)
      invoice1 = create(:invoice, merchant: merchant, customer: customer)
      invoice2 = create(:invoice, merchant: merchant, customer: customer)
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:transaction, invoice: invoice2)
      create(:invoice_item, invoice: invoice1, item: item)

      expect(item.best_day.updated_at.to_s).to eq('2018-04-30 23:12:54 UTC')
    end
  end

  describe 'class methods' do
    it '.most_revenue' do
      merchant = create(:merchant)
      customer = create(:customer)      
      item1    = create(:item, merchant: merchant)
      item2    = create(:item, merchant: merchant)
      invoice1 = create(:invoice, merchant: merchant, customer: customer)
      invoice2 = create(:invoice, merchant: merchant, customer: customer)
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:transaction, invoice: invoice2)
      create(:invoice_item, invoice: invoice1, item: item1)
      create(:invoice_item, invoice: invoice2, item: item2)

      expect(Item.most_revenue).to eq([item2, item1])
      expect(Item.most_revenue(1)).to eq([item2])
    end

    it '.most_sold' do
      merchant = create(:merchant)
      customer = create(:customer)      
      item1    = create(:item, merchant: merchant)
      item2    = create(:item, merchant: merchant)
      invoice1 = create(:invoice, merchant: merchant, customer: customer)
      invoice2 = create(:invoice, merchant: merchant, customer: customer)
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:transaction, invoice: invoice2)
      create(:invoice_item, invoice: invoice1, item: item1)
      create(:invoice_item, invoice: invoice2, item: item2)
      
      expect(Item.most_sold).to eq([item2, item1])
      expect(Item.most_sold(1)).to eq([item2])
    end
  end
end
