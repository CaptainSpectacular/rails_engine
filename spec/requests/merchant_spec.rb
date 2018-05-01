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
    expect(JSON.parse(response.body)).to eq(JSON.parse(merchant.to_json
))
  end
end
