require 'rails_helper'

describe MerchantSerializer do
  describe 'attributes' do
    let(:merchant) { create(:merchant) }
    let(:serializer) { described_class.new(merchant) }

    it 'has expected attributes' do
      attributes = %i[id name]

      serializer.attributes.keys.each do |attr|
        expect(attr).to be_in(attributes)
      end
    end
  end
end
