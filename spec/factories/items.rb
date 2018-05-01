FactoryBot.define do
  factory :item, class: Item do
    name "Guitar"
    description "Super great guitar"
    unit_price "100.99"
    merchant
  end
  factory :item_2, class: Item do
    name "Drums"
    description "Really bad drums"
    unit_price "200"
    merchant
  end
end
