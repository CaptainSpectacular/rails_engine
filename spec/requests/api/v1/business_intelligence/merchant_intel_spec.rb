require 'rails_helper'

describe "Merchant Intel" do
  it "can find the customer with most successful transaction" do
    merchant = create(:merchant)
    customer_1 = merchant.customers.create(first_name: "Alex", last_name: "Cutschall")
    customer_2 = merchant.customers.create(first_name: "Clee", last_name: "Pollock")
    invoice_1 = customer_1.invoices.create(status: "shipped", merchant_id: merchant.id)
    invoice_2 = customer_2.invoices.create(status: "pending", merchant_id: merchant.id)
    transaction_1 = invoice_1.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_2 = invoice_1.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_3 = invoice_2.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_4 = invoice_2.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "failed")

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(response).to be_success

    best_customer = JSON.parse(response.body)

    expect(best_customer["id"]).to eq(customer_1.id)
  end
  it "can return the top number of merchants depending on revenue" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)
    customer_1 = merchant_1.customers.create(first_name: "Alex", last_name: "Cutschall")
    customer_2 = merchant_2.customers.create(first_name: "Clee", last_name: "Pollock")
    customer_3 = merchant_3.customers.create(first_name: "Jimmy", last_name: "Nelson")
    invoice_1 = customer_1.invoices.create(status: "shipped", merchant_id: merchant_1.id)
    invoice_2 = customer_2.invoices.create(status: "shipped", merchant_id: merchant_2.id)
    invoice_3 = customer_3.invoices.create(status: "pending", merchant_id: merchant_3.id)
    transaction_1 = invoice_1.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_2 = invoice_1.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_3 = invoice_2.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_4 = invoice_3.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "failed")
    item = create(:item)
    invoice_item_1 = invoice_1.invoice_items.create(item_id: item.id, quantity: 5, unit_price: 1000)
    invoice_item_2 = invoice_2.invoice_items.create(item_id: item.id, quantity: 15, unit_price: 1000)
    invoice_item_3 = invoice_3.invoice_items.create(item_id: item.id, quantity: 5, unit_price: 1000)

    x = 2
    get "/api/v1/merchants/most_revenue?quantity=#{x}"

    expect(response).to be_success

    top_merchants = JSON.parse(response.body)

    expect(top_merchants[0]["id"]).to eq(merchant_2.id)
    expect(top_merchants[1]["id"]).to eq(merchant_1.id)
  end
  it "can get the total revenue for a specific date" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)
    customer_1 = merchant_1.customers.create(first_name: "Alex", last_name: "Cutschall")
    customer_2 = merchant_2.customers.create(first_name: "Clee", last_name: "Pollock")
    customer_3 = merchant_3.customers.create(first_name: "Jimmy", last_name: "Nelson")
    invoice_1 = customer_1.invoices.create(status: "shipped", merchant_id: merchant_1.id)
    invoice_2 = customer_2.invoices.create(status: "shipped", merchant_id: merchant_2.id)
    invoice_3 = customer_3.invoices.create(status: "pending", merchant_id: merchant_3.id)
    transaction_1 = invoice_1.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_2 = invoice_1.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_3 = invoice_2.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_4 = invoice_3.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "failed")
    item = create(:item)
    invoice_item_1 = invoice_1.invoice_items.create(item_id: item.id, quantity: 5, unit_price: 1000, created_at: "2018-04-30")
    invoice_item_2 = invoice_2.invoice_items.create(item_id: item.id, quantity: 15, unit_price: 1000, created_at: "2018-04-30")
    invoice_item_3 = invoice_3.invoice_items.create(item_id: item.id, quantity: 5, unit_price: 1000, created_at: "2018-04-30")

    x = "2018-04-30"
    get "/api/v1/merchants/revenue?date=#{x}"

    expect(response).to be_success

    found_revenue = JSON.parse(response.body)
  end

  it 'can find the customers with pending invoices' do
    merchant = create(:merchant)
    customer_1 = merchant.customers.create(first_name: "Alex", last_name: "Cutschall")
    customer_2 = merchant.customers.create(first_name: "Clee", last_name: "Pollock")
    customer_3 = merchant.customers.create(first_name: "Jimmy", last_name: "Nelson")
    invoice_1 = customer_1.invoices.create(status: "shipped", merchant_id: merchant.id)
    invoice_2 = customer_2.invoices.create(status: "shipped", merchant_id: merchant.id)
    invoice_3 = customer_3.invoices.create(status: "pending", merchant_id: merchant.id)
    transaction_1 = invoice_1.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_2 = invoice_1.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_3 = invoice_2.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "success")
    transaction_4 = invoice_3.transactions.create(credit_card_number: 4343434343,
                                                  credit_card_expiration_date: "2018-05-01 08:26:26",
                                                  result: "failed")
    item = create(:item)
    invoice_item_1 = invoice_1.invoice_items.create(item_id: item.id, quantity: 5, unit_price: 1000, created_at: "2018-04-30")
    invoice_item_2 = invoice_2.invoice_items.create(item_id: item.id, quantity: 15, unit_price: 1000, created_at: "2018-04-30")
    invoice_item_3 = invoice_3.invoice_items.create(item_id: item.id, quantity: 5, unit_price: 1000, created_at: "2018-04-30")

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

    expect(response).to be_success

    pending_customers = JSON.parse(response.body)

    expect(pending_customers[0]["id"]).to eq(customer_3.id)
  end
end
