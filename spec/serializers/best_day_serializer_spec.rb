require 'rails_helper'

describe BestDaySerializer do
  describe '#best_day' do
    let(:item) { create(:item) }
    let(:serializer) { described_class.new(item) }

    it 'returns a date time' do
      expect(serializer.object).to eq(item)
      expect(serializer.best_day).to be_an(ActiveSupport::TimeWithZone)
    end 
  end
end
