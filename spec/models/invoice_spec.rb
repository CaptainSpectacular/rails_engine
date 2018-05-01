require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    context "should belong to a merchant" do
      it { should belong_to(:merchant) }
    end
  end
end
