require 'rails_helper'

describe 'endpoints' do
  it 'has index' do
    m1, m2, m3 = create_list(:merchant, 3)
    get '/api/v1/merchants'

    expect(response).to be_success
    expect(JSON.parse(response.body).first).to eq(JSON.parse(m1.to_json))
    expect(JSON.parse(response.body)[1]).to eq(JSON.parse(m2.to_json))
  end

  it 'has show' do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_success
    expect(JSON.parse(response.body)).to eq(JSON.parse(merchant.to_json))
  end

  it 'has find' do 
    merchant = create(:merchant)
    get '/api/v1/merchants/find?id=1'

    expect(response).to be_success
    expect(JSON.parse(response.body)).to eq(JSON.parse(merchant.to_json))
  end

  it 'has random' do
    m1, m2 = create_list(:merchant, 2)
    get '/api/v1/merchants/random'

    expect(response).to be_success
  end

  it 'can request the items from a merchant' do
    merchant = create(:merchant)
    id = merchant.id
    item_1 = merchant.items.create(name: "Guitar", description: "Really cool guitar", unit_price: 10000)
    item_2 = merchant.items.create(name: "Drums", description: "Really cool drums", unit_price: 20000)

    get "/api/v1/merchants/#{id}/items"

    searched_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_items.count).to eq(2)
  end
end
