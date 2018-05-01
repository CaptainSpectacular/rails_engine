require 'rails_helper'

describe 'Invoices API' do
  it 'sends a list of invoices' do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end
  it 'can get one invoice by its id' do
    invoice = create(:invoice)
    id = invoice.id

    get "/api/v1/invoices/#{id}"

    new_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(new_invoice["id"]).to eq(id)
  end
  it 'can get one invoice by finding id' do
    invoice = create(:invoice)
    id = invoice.id

    get "/api/v1/invoices/find?id=#{id}"

    searched_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoice["id"]).to eq(id)
  end
  it 'can get one invoice by finding status' do
    invoice = create(:invoice)
    status = invoice.status

    get "/api/v1/invoices/find?status=#{status}"

    searched_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoice["status"]).to eq(status)
  end
  it 'can get one invoice by finding created at' do
    invoice = create(:invoice)
    created = invoice.created_at

    get "/api/v1/invoices/find?created_at=#{created}"

    searched_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoice["created_at"].to_datetime).to eq(created)
  end
  it 'can get one invoice by finding updated at' do
    invoice = create(:invoice)
    updated = invoice.updated_at

    get "/api/v1/invoices/find?updated_at=#{updated}"

    searched_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoice["updated_at"].to_datetime).to eq(updated)
  end
  it 'can find all the invoices matching a status' do
    list = create_list(:invoice, 3)
    status = list[0][:status]

    get "/api/v1/invoices/find_all?status=#{status}"

    searched_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoices.count).to eq(3)
    expect(searched_invoices[0]["status"]).to eq("shipped")
    expect(searched_invoices[1]["status"]).to eq("shipped")
    expect(searched_invoices[2]["status"]).to eq("shipped")
  end
  it 'can find all the invoices matching created at date' do
    list = create_list(:invoice, 3)
    created_at = list[0][:created_at]

    get "/api/v1/invoices/find_all?created_at=#{created_at}"

    searched_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoices.count).to eq(3)
    expect(searched_invoices[0]["created_at"].to_datetime).to eq("2018-04-30 23:12:53")
    expect(searched_invoices[1]["created_at"].to_datetime).to eq("2018-04-30 23:12:53")
    expect(searched_invoices[2]["created_at"].to_datetime).to eq("2018-04-30 23:12:53")
  end
  it 'can find all the invoices matching updated at date' do
    list = create_list(:invoice, 3)
    updated_at = list[0][:updated_at]

    get "/api/v1/invoices/find_all?updated_at=#{updated_at}"

    searched_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoices.count).to eq(3)
    expect(searched_invoices[0]["updated_at"].to_datetime).to eq("2018-04-30 23:12:54")
    expect(searched_invoices[1]["updated_at"].to_datetime).to eq("2018-04-30 23:12:54")
    expect(searched_invoices[2]["updated_at"].to_datetime).to eq("2018-04-30 23:12:54")
  end
  it 'can find a random invoice' do
    list = create_list(:invoice, 3)

    get "/api/v1/invoices/random"

    searched_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoices.count).to eq(6)
  end
end
