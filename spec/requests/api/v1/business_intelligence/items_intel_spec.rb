require 'rails_helper'

describe 'Items Intelligence' do
  it 'can find the most revenue for a certain quantity' do
    merchant     = create(:merchant)
    item         = create(:item)
    invoice      = create(:invoice, merchant: merchant) 
    transaction  = create(:transaction, invoice: invoice)
    invoice_item = create(:invoice_item, item: item, invoice: invoice)

    get "/api/v1/items/most_revenue?quantity=#{item.id}"

    expect(response).to be_success

    searched_item = JSON.parse(response.body).first

    expect(searched_item["id"]).to eq(item.id)
  end
end
