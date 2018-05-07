require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    context "should belong to a merchant" do
      it { should belong_to(:merchant) }
      it { should belong_to(:customer) }
      it { should have_many(:transactions) }
      it { should have_many(:invoice_items) }
      it { should have_many(:transactions) }
    end
  end
end
