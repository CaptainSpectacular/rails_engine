require 'rails_helper'

describe CustomerSerializer do
  describe 'attributes ' do
    let(:customer) { create(:customer) }
    let(:serializer) { described_class.new(customer) }

    it 'does not have all customer attributes' do
      attributes = %i[id first_name last_name]

      serializer.attributes.keys.each do |attr|
        expect(attr).to be_in(attributes)
      end
    end
  end
end
