FactoryBot.define do
  factory :transaction do
    invoice_id 1
    credit_card_number 1122334455667789 
    credit_card_expiration_date "2018-05-01 08:26:26"
    result "MyString"
  end
end
