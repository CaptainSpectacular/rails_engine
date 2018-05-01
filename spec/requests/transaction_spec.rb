require 'rails_helper'

describe 'endpoints' do
  it 'has index' do
    t1, t2, t3 = create_list(:transaction, 3)
    get '/api/v1/transactions'

    expect(response).to be_success
    expect(JSON.parse(response.body).first).to eq(JSON.parse(t1.to_json)) 
    expect(JSON.parse(response.body)[1]).to eq(JSON.parse(t2.to_json))
  end

  it 'has show' do
    transaction = create(:transaction)
    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_success
    expect(JSON.parse(response.body)).to eq(JSON.parse(transaction.to_json))
  end
end 
