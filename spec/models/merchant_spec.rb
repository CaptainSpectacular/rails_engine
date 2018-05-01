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

  describe 'class methods' do
    it '.random' do
      m1 = Merchant.create(name: 'Barnabus')
      m2 = Merchant.create(name: 'Jiccus')
      m3 = Merchant.create(name: 'Lerry')

      expect(Merchant.random.first).to be_in([m1, m2, m3])
    end
  end
  describe 'relationships' do
    it { should have_many(:items) }
  end
end
