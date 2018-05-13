require 'rails_helper'

describe DateRevenueSerializer do
  describe '#total_revenue' do
    let(:serializer) { described_class.new(129802) }

    it 'formats the price' do
      expect(serializer.total_revenue).to match(/\d*\.\d\d/)
    end
  end
end
