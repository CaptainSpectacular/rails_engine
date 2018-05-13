require 'rails_helper'

describe InvoiceSerializer do
  describe 'attributes' do
    let(:invoice) { create(:invoice) }
    let(:serializer) { described_class.new(invoice) }

    it 'only has expected attributes' do
      attributes = %i[id customer_id merchant_id status]

      serializer.attributes.keys.each do |attr|
        expect(attr).to be_in(attributes)
      end
    end
  end
end
