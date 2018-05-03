require 'rails_helper'

describe 'endpoints' do
  it 'has index' do
    c1, c2 = create_list(:customer, 2)
    get '/api/v1/customers'

    anticipated = JSON.parse(response.body) 
     
    expect(anticipated.first['id']).to eq(c1.id)
    expect(anticipated.last['id']).to eq(c2.id)
  end

  it 'has show' do
    customer = create(:customer)
    get "/api/v1/customers/#{customer.id}"

    anticipated = JSON.parse(response.body)

    expect(anticipated['id']).to eq(customer.id)
  end

  it 'can find by id' do
    customer = create(:customer)
    get "/api/v1/customers/find?id=#{customer.id}"

    anticipated = JSON.parse(response.body)

    expect(anticipated['id']).to eq(customer.id)
  end

  it 'can find by first_name' do
    customer = create(:customer)
    get "/api/v1/customers/find?id=#{customer.id}"

    anticipated = JSON.parse(response.body)

    expect(anticipated['id']).to eq(customer.id)
  end

  it 'can find all by last_name' do
    c1, c2 = create_list(:customer, 2)
    get "/api/v1/customers/find_all?last_name=#{c1.last_name}"

    anticipated = JSON.parse(response.body)

    expect(anticipated.first['id']).to eq(c1.id)
    expect(anticipated.last['id']).to eq(c2.id)
  end

  it 'has random' do
    c1, c2 = create_list(:customer, 2)
    get '/api/v1/customers/random'

    anticipated = JSON.parse(response.body)

    expect(anticipated.first['id']).to be_in([c1.id, c2.id])
  end

  it 'can show the invoices of a customer' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice_1 = customer.invoices.create(status: "shipped", merchant_id: merchant.id)
    invoice_2 = customer.invoices.create(status: "pending", merchant_id: merchant.id)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_success

    customer_invoices = JSON.parse(response.body)
    expect(customer_invoices.count).to eq(2)
  end

  it 'can show the transactions of a customer' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = customer.invoices.create(status: "shipped", merchant_id: merchant.id)
    invoice_2 = customer.invoices.create(status: "pending", merchant_id: merchant.id)
    transaction_1 = invoice.transactions.create(credit_card_number: "434343434343",
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_2 = invoice_2.transactions.create(credit_card_number: "434343434343",
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_success

    customer_transactions = JSON.parse(response.body)

    expect(customer_transactions.count).to eq(2)
  end
end
