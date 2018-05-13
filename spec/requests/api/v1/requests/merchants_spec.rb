require 'rails_helper'

describe 'endpoints' do
  it 'has index' do
    m1, m2, m3 = create_list(:merchant, 3)
    get '/api/v1/merchants'

    expect(response).to be_success
    expect(JSON.parse(response.body).first['id']).to eq(m1.id)
    expect(JSON.parse(response.body).last['id']).to eq(m3.id)
  end

  it 'has show' do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_success
    expect(JSON.parse(response.body)['id']).to eq(merchant.id)
  end

  it 'has find' do
    merchant = create(:merchant)
    get '/api/v1/merchants/find?id=1'

    expect(response).to be_success
    expect(JSON.parse(response.body)['id']).to eq(merchant.id)
  end

  it 'has find_all' do
    create(:merchant, name: 'Dunkey')
    create(:merchant, name: 'Dunkey')
    create(:merchant, name: 'dunkey')
    get '/api/v1/merchants/find_all?name=Dunkey'

    expect(response).to be_success
    expect(JSON.parse(response.body).size).to eq(2)
  end
  it 'has random' do
    m1, m2 = create_list(:merchant, 2)
    get '/api/v1/merchants/random'

    expect(response).to be_success
  end

  it 'can request the items from a merchant' do
    merchant = create(:merchant)
    item_1 = merchant.items.create(name: "Guitar", description: "Really cool guitar", unit_price: 10000)
    item_2 = merchant.items.create(name: "Drums", description: "Really cool drums", unit_price: 20000)

    get "/api/v1/merchants/#{merchant.id}/items"

    searched_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_items.count).to eq(2)
  end

  it 'can request the invoices from a merchant' do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = merchant.invoices.create(status: "shipped", customer_id: customer.id)
    invoice_2 = merchant.invoices.create(status: "shipped", customer_id: customer.id)
    get "/api/v1/merchants/#{merchant.id}/invoices"

    searched_items = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(searched_items.count).to eq(2)
  end

  it 'most_items' do
    get '/api/v1/merchants/most_items'

    expect(response).to be_success
    # TODO write a better test
  end
end
