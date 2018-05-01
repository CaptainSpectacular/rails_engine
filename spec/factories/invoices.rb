FactoryBot.define do
  factory :invoice do
    customer_id 1
    merchant
    status "shipped"
    created_at "2018-04-30 23:12:53"
    updated_at "2018-04-30 23:12:54"
  end
  factory :invoice_2 do
    customer_id 2
    merchant
    status "pending"
    created_at "2017-04-30 23:12:53"
    updated_at "2017-04-30 23:12:54"
  end
end
