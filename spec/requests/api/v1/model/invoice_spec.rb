require 'rails_helper'

describe "Invoice" do
  describe "validations" do
    it "is processable if it has at least one successful transaction" do
      invoice = create(:invoice)
      transaction_1 = create(:transaction, invoice: invoice)
      transaction_2 = create(:transaction, invoice: invoice, result: "failed")


    end
  end


  describe "processable?" do
    describe "when there are no transactions" do
      before :each do
        @invoice = create(:invoice)
        # make the invoice with no transactions
      end

      it "returns false" do
        expect(@invoice.processable?).to eq(false)
        # call invoice.processable?
        # assert that it's false
      end
    end

    describe "when there is one failed transaction" do
      before :each do
        @invoice = create(:invoice)
        create(:transaction, invoice: @invoice, result: "failed")
      end

      it "returns false" do
        expect(@invoice.processable?).to eq(false)
      end
    end

    describe "when there is one successful and one failed transaction" do
      before :each do
        @invoice = create(:invoice)
        create(:transaction, invoice: @invoice, result: "failed")
        create(:transaction, invoice: @invoice)
      end

      it "returns true" do
        expect(@invoice.processable?).to eq(true)
      end
    end
  end
end
