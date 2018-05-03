FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number 1122334455667789
    credit_card_expiration_date "2018-05-01 08:26:26"
    result "success"
    created_at "2018-05-01 19:04:06 UTC"
    updated_at "2018-05-01 19:04:06 UTC"
  end
end
