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

    get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

    searched_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoice["id"]).to eq(invoice.id)
  end

  it 'can get one invoice by finding updated at' do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

    searched_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoice["id"]).to eq(invoice.id)
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
    i1, i2, i3 = create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?created_at=#{i1.created_at}"

    searched_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoices.count).to eq(3)
    expect(searched_invoices[0]["id"]).to eq(i1.id)
    expect(searched_invoices[1]["id"]).to eq(i2.id)
    expect(searched_invoices[2]["id"]).to eq(i3.id)
  end
  it 'can find all the invoices matching updated at date' do
    i1, i2, i3 = create_list(:invoice, 3)
    get "/api/v1/invoices/find_all?updated_at=#{i1.updated_at}"

    searched_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoices.count).to eq(3)
    expect(searched_invoices[0]["id"]).to eq(i1.id)
    expect(searched_invoices[1]["id"]).to eq(i2.id)
    expect(searched_invoices[2]["id"]).to eq(i3.id)
  end
  it 'can find a random invoice' do
    list = create_list(:invoice, 3)

    get "/api/v1/invoices/random"

    searched_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_invoices.count).to eq(4)
  end
end
