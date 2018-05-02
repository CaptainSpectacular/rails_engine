require 'rails_helper'

describe 'invoice_items relationship endpoints' do
  it 'has invoice' do
    invoice_item = create(:invoice_item)
    get '/api/v1/invoice_items/1/invoice'

    anticipated = JSON.parse(response.body)
    expected = invoice_item.invoice

    expect(anticipated['id']).to eq(expected.id)
  end

  it 'has item' do
    invoice_item = create(:invoice_item)
    get '/api/v1/invoice_items/1/item'

    anticipated = JSON.parse(response.body)
    expected = invoice_item.item

    expect(anticipated['id']).to eq(expected.id)
  end
end
