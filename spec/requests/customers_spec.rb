require 'rails_helper'

describe 'endpoints' do
  it 'has index' do
    c1, c2 = create_list(:customer, 2)
    get '/api/v1/customers'

    anticipated = JSON.parse(response.body) 
    e1 = JSON.parse(c1.to_json)
    e2 = JSON.parse(c2.to_json)

    expect(anticipated.first).to eq(e1)
    expect(anticipated.last).to eq(e2)
  end

  it 'has show' do
    customer = create(:customer)
    get "/api/v1/customers/#{customer.id}"

    anticipated = JSON.parse(response.body)
    expected = JSON.parse(customer.to_json)

    expect(anticipated).to eq(expected)
  end
end
