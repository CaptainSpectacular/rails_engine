require 'rails_helper'

describe FavoriteMerchantSerializer do
  let(:merchant) { create(:merchant) }
  let(:serializer) { described_class.new(merchant) }

  describe 'attributes' do
    it 'should have expected attributes' do
      attributes = %i[id name]

      serializer.attributes.keys.each do |attr|
        expect(attr).to be_in(attributes)
      end
    end
  end
end
