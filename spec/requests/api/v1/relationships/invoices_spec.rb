require 'rails_helper'

describe 'invoice relationship endpoints' do
  it 'has transactions' do
    invoice = create(:invoice)
    2.times do
      invoice.transactions << create(:transaction)
    end

    get "/api/v1/invoices/#{invoice.id}/transactions"

    anticipated = JSON.parse(response.body)
    expected    = invoice.transactions

    expect(anticipated.first['id']).to eq(expected.first.id)
    expect(anticipated.last['id']).to eq(expected.last.id)
  end

  it 'has invoice_items' do
    invoice = create(:invoice)
    2.times do
      invoice.invoice_items << create(:invoice_item)
    end

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    anticipated = JSON.parse(response.body)
    expected    = invoice.invoice_items

    expect(anticipated.first['id']).to eq(expected.first.id)
    expect(anticipated.last['id']).to eq(expected.last.id)
  end

  it 'has items' do
    invoice = create(:invoice)
    2.times do
      invoice.items << create(:item) 
    end

    get "/api/v1/invoices/#{invoice.id}/items"
  
    anticipated = JSON.parse(response.body)
    expected    = invoice.items

    expect(anticipated.first['id']).to eq(expected.first.id)
    expect(anticipated.last['id']).to eq(expected.last.id)
  end


  it 'has customer' do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}/customer"

    anticipated = JSON.parse(response.body)
    expected = invoice.customer

    expect(anticipated['id']).to eq(expected.id) 
  end

  it 'has merchant' do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    anticipated = JSON.parse(response.body)
    expected = invoice.merchant

    expect(anticipated['id']).to eq(expected.id) 
  end
end
