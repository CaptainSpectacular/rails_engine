require 'rails_helper'

describe RevenueSerializer do
  let(:serializer) { described_class.new(12303) }
  describe '#revenue' do
    it 'should format the price' do
      expect(serializer.revenue).to match(/\d*\.\d\d/)
    end
  end   
end
