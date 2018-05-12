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
  end
end
