FactoryBot.define do
  factory :invoice_item, class: InvoiceItem do
    item
    invoice
    quantity 5
    unit_price "135.99"
    created_at "2018-04-30 23:12:53"
    updated_at "2018-04-30 23:12:54"
  end

  factory :invoice_item_2, class: InvoiceItem do
    item
    invoice
    quantity 10
    unit_price "200.00"
    created_at "2018-04-30 23:12:53"
    updated_at "2018-04-30 23:12:54"
  end
end
