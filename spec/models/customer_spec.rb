require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:invoices) }
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to have_many(:merchants) }
  end
  
  describe 'instance_methods 'do
    it '#favorite_merchant' do
      customer = create(:customer)
      m1, m2   = create_list(:merchant, 2)
      m1_invoice = create(:invoice, merchant: m1, customer: customer)
      m2_invoice1 = create(:invoice, merchant: m2, customer: customer)
      m2_invoice2 = create(:invoice, merchant: m2, customer: customer)
      create(:transaction, invoice: m1_invoice)
      create(:transaction, invoice: m2_invoice1)
      create(:transaction, invoice: m2_invoice2)

      expect(customer.favorite_merchant).to eq(m2)
    end
  end
end
