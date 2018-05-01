require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it 'has an invoice_id' do
      invalid = Transaction.create(credit_card_number: 1122821, result: 'success')

      expect(invalid).to_not be_valid
    end

    it 'has a credit_card_number' do
      invalid = Transaction.create(invoice_id: 1, result: 'success')

      expect(invalid).to_not be_valid
    end

    it 'has a result' do
      invalid = Transaction.create(invoice_id: 1, credit_card_number: 1122821)

      expect(invalid).to_not be_valid
    end

    it 'is valid with all attributes' do
      transaction = create(:transaction)

      expect(transaction).to be_valid
    end
  end
end
