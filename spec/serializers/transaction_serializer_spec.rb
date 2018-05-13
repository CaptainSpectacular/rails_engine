require 'rails_helper'

describe TransactionSerializer do
  let(:transaction) { create(:transaction) }
  let(:serializer) { described_class.new(transaction) }

  describe 'attributes' do
    it 'only has expected attributes' do
      attributes = %i[id credit_card_number invoice_id result]

      serializer.attributes.keys.each do |attr|
        expect(attr).to be_in(attributes)
      end
    end
  end
end
