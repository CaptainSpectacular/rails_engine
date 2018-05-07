FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status "shipped"
    created_at "2018-04-30 23:12:53"
    updated_at "2018-04-30 23:12:54"
  end

  factory :invoice_2 do
    customer
    merchant
    status "pending"
    created_at "2017-04-30 23:12:53"
    updated_at "2017-04-30 23:12:54"
  end
end
