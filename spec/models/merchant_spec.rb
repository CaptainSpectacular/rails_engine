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

  describe 'class methods' do
  end
end
