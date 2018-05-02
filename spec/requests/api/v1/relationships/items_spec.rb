require 'rails_helper'

describe 'items relationships endpoints' do
  it 'has merchant' do
    item = create(:item)
    2.times do
      item.invoice_items << create(:invoice_item)
    end

    get "/api/v1/items/#{item.id}/merchant"

    anticipated = JSON.parse(response.body)
    expected = item.merchant

    expect(anticipated['id']).to eq(expected.id)
  end

  it 'has invoice_items' do
    item = create(:item)
    2.times do
      item.invoice_items << create(:invoice_item)
    end
    
    get "/api/v1/items/#{item.id}/invoice_items"

    anticipated = JSON.parse(response.body)
    expected = item.invoice_items
    
    expect(anticipated.first['id']).to eq(expected.first.id) 
  end
end
