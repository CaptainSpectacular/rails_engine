require 'rails_helper'

describe InvoiceItemSerializer do
  let(:invoice_item) { create(:invoice_item) }
  let(:serializer) { described_class.new(invoice_item) }

  describe 'attributes' do
    it 'only has expected attributes' do
      attributes = %i[id invoice_id item_id quantity unit_price] 

      serializer.attributes.keys.each do |attr|
        expect(attr).to be_in(attributes)
      end
    end
  end

  describe '#unit_price' do
    it 'formats the unit_price' do
      expect(serializer.unit_price).to match(/\d*\.\d\d/)
    end
  end
end
