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

  it 'can find by id' do
    customer = create(:customer)
    get "/api/v1/customers/find?id=#{customer.id}"

    anticipated = JSON.parse(response.body)
    expected = JSON.parse(customer.to_json)

    expect(anticipated).to eq(expected)
  end

  it 'can find by first_name' do
    customer = create(:customer)
    get "/api/v1/customers/find?id=#{customer.id}"

    anticipated = JSON.parse(response.body)
    expected = JSON.parse(customer.to_json)

    expect(anticipated).to eq(expected)
  end

  it 'can find all by last_name' do
    c1, c2 = create_list(:customer, 2)
    get "/api/v1/customers/find_all?last_name=#{c1.last_name}"

    anticipated = JSON.parse(response.body)
    e1 = JSON.parse(c1.to_json)
    e2 = JSON.parse(c2.to_json)

    expect(anticipated.first).to eq(e1)
    expect(anticipated.last).to eq(e2)
  end
end
