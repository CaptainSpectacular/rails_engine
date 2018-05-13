require 'rails_helper'

describe ItemSerializer do
  let(:item) { create(:item) }
  let(:serializer) { described_class.new(item) }
  describe '#unit_price' do
    it 'formats the item unit price' do
      expect(serializer.unit_price).to match(/\d*\.\d\d/)
    end
  end

  describe 'attributes' do
    it 'does not have all item attributes' do
      attributes = %i[id name description unit_price merchant_id]

      serializer.attributes.keys.each do |attr|
        expect(attr).to be_in(attributes)
      end
    end
  end
end
