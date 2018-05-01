FactoryBot.define do
  factory :invoice do
    customer_id 1
    merchant_id 1
    status "shipped"
    created_at "2018-04-30 23:12:53"
    updated_at "2018-04-30 23:12:54"
  end
  factory :invoice_2 do
    customer_id 2
    merchant_id 2
    status "pending"
    created_at "2017-04-30 23:12:53"
    updated_at "2017-04-30 23:12:54"
  end
end
