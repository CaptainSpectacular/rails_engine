require 'rails_helper'

describe 'Invoice Item API' do
  it 'can find all of the Invoice Items' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    searched_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoice_items.count).to eq(3)
  end
  it 'can find a single a single invoice item' do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(response).to be_success

    searched_invoice_items = JSON.parse(response.body)

    expect(searched_invoice_items["id"]).to eq(invoice_item.id)
  end
  it 'can search for a single invoice item from id' do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    expect(response).to be_success

    searched_invoice_item = JSON.parse(response.body)

    expect(searched_invoice_item["id"]).to eq(invoice_item.id)
  end
  it 'can search for a single invoice item from quantity' do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

    expect(response).to be_success

    searched_invoice_item = JSON.parse(response.body)

    expect(searched_invoice_item["quantity"]).to eq(invoice_item.quantity)
  end
  it 'can search for a single invoice item from unit price' do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price.to_s}"

    expect(response).to be_success

    searched_invoice_item = JSON.parse(response.body)

    expect(searched_invoice_item["unit_price"]).to eq(invoice_item.unit_price.to_s)
  end

  it 'can search for a single invoice item from created at' do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    expect(response).to be_success

    searched_invoice_item = JSON.parse(response.body)

    expect(searched_invoice_item["id"]).to eq(invoice_item.id)
  end

  it 'can search for a single invoice item from created at' do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

    expect(response).to be_success

    searched_invoice_item = JSON.parse(response.body)

    expect(searched_invoice_item["id"]).to eq(invoice_item.id)
  end
  it 'can search for all invoice items from quantity' do
    invoice_items = create_list(:invoice_item, 3)
    quantity = invoice_items[0][:quantity]

    get "/api/v1/invoice_items/find_all?quantity=#{quantity}"

    expect(response).to be_success

    searched_invoice_items = JSON.parse(response.body)

    expect(searched_invoice_items[0]["quantity"]).to eq(quantity)
    expect(searched_invoice_items[1]["quantity"]).to eq(quantity)
    expect(searched_invoice_items[2]["quantity"]).to eq(quantity)
    expect(searched_invoice_items.count).to eq(3)
  end
  it 'can search for all invoice items from unit price' do
    invoice_items = create_list(:invoice_item, 3)
    unit_price = invoice_items[0][:unit_price]

    get "/api/v1/invoice_items/find_all?unit_price=#{unit_price}"

    expect(response).to be_success

    searched_invoice_items = JSON.parse(response.body)

    expect(searched_invoice_items[0]["unit_price"]).to eq(unit_price.to_s)
    expect(searched_invoice_items[1]["unit_price"]).to eq(unit_price.to_s)
    expect(searched_invoice_items[2]["unit_price"]).to eq(unit_price.to_s)
    expect(searched_invoice_items.count).to eq(3)
  end

  it 'can search for all invoice items from created at' do
    ii1,ii2, ii3 = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?created_at=#{ii1.created_at}"

    expect(response).to be_success

    searched_invoice_items = JSON.parse(response.body)

    expect(searched_invoice_items[0]["id"]).to eq(ii1.id)
    expect(searched_invoice_items[1]["id"]).to eq(ii2.id)
    expect(searched_invoice_items[2]["id"]).to eq(ii3.id)
    expect(searched_invoice_items.count).to eq(3)
  end

  it 'can search for all invoice items from updated at' do
    ii1, ii2, ii3 = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?updated_at=#{ii1.updated_at}"

    expect(response).to be_success

    searched_invoice_items = JSON.parse(response.body)

    expect(searched_invoice_items[0]["id"]).to eq(ii1.id)
    expect(searched_invoice_items[1]["id"]).to eq(ii2.id)
    expect(searched_invoice_items[2]["id"]).to eq(ii3.id)
    expect(searched_invoice_items.count).to eq(3)
  end

  it 'can find a random invoice item' do
    invoice_item = create(:invoice_item)
    invoice_item_2 = create(:invoice_item_2)

    get '/api/v1/invoice_items/random'

    expect(response).to be_success

    searched_invoice_item = JSON.parse(response.body)

    expect(searched_invoice_item.count).to eq(5)
  end
end
