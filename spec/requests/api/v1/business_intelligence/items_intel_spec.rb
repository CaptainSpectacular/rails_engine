require 'rails_helper'

describe 'Items Intelligence' do
  xit 'can find the most revenue for a certain quantity' do
    item_1 = create(:item)
    item_2 = create(:item_2)
    x = 1

    get "/api/v1/items/most_revenue?quantity=#{x}"

    expect(response).to be_success

    searched_item = JSON.parse(response.body)

    expect(searched_item["name"]).to eq(item_2.name)
    expect(searched_item["description"]).to eq(item_2.description)
    expect(searched_item["unit_price"]).to eq(item_2.unit_price)
  end
end
