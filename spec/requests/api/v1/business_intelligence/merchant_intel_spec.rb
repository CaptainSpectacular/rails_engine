require 'rails_helper'

describe "Merchant Intel" do
  it "can find customers with pending invoices" do
    #most number of successful transactions
    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
  end
end
