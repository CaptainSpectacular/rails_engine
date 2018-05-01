require 'rails_helper'

describe 'endpoints' do
  it 'has index' do
    t1, t2, t3 = create_list(:transaction, 3)
    get '/api/v1/transactions'

    expect(response).to be_success
    expect(JSON.parse(response.body).first['id']).to eq(t1.id) 
    expect(JSON.parse(response.body)[1]['id']).to eq(t2.id)
  end

  it 'has show' do
    transaction = create(:transaction)
    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_success
    expect(JSON.parse(response.body)['id']).to eq(transaction.id)
  end

  it 'can find by id' do
    t1 = create(:transaction)
    get "/api/v1/transactions/find?id=#{t1.id}"

    expected = t1.id 
    anticipated = JSON.parse(response.body)['id']

    expect(response).to be_success
    expect(anticipated).to eq(expected)
  end 

  it 'can find by invoice_id' do
    t1 = create(:transaction)
    get "/api/v1/transactions/find?invoice_id=#{t1.invoice_id}"

    expected = t1.id
    anticipated = JSON.parse(response.body)['id']

    expect(response).to be_success
    expect(anticipated).to eq(expected)
  end

  it 'can find by credit_card_number' do
    t1 = create(:transaction)
    get "/api/v1/transactions/find?credit_card_number=#{t1.credit_card_number}"

    expected = t1.id 
    anticipated = JSON.parse(response.body)['id']

    expect(response).to be_success
    expect(anticipated).to eq(expected)
  end

  it 'can find by credit_card_number' do
    t1 = create(:transaction)
    get "/api/v1/transactions/find?result=#{t1.result}"

    expected = t1.id 
    anticipated = JSON.parse(response.body)['id']

    expect(response).to be_success
    expect(anticipated).to eq(expected)
  end
    
  it 'can find_by created_at' do
    t1 = create(:transaction)
    get "/api/v1/transactions/find?created_at=#{t1.created_at}"

    expected = t1.id 
    anticipated = JSON.parse(response.body)['id']

    expect(response).to be_success
    expect(anticipated).to eq(expected)

  end

  it 'can find_by updated_at' do
    t1 = create(:transaction)
    get "/api/v1/transactions/find?updated_at=#{t1.updated_at}"
    
    expected = t1.id 
    anticipated = JSON.parse(response.body)['id']

    expect(response).to be_success
    expect(anticipated).to eq(expected)
 end

  it 'can find all by id' do
    t1 = create(:transaction)
    get "/api/v1/transactions/find_all?updated_at=#{t1.updated_at}"
    
    expected = t1.id 
    anticipated = JSON.parse(response.body)['id']

    expect(response).to be_success
    expect(anticipated).to eq(expected)
  end
end




 
