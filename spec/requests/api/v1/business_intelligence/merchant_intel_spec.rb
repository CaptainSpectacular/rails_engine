require 'rails_helper'

describe "Merchant Intel" do
  it "can find customers with pending invoices" do
    #most number of successful transactions
    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
  end
  it "can return the top number of merchants depending on revenue" do
    x = 5
    get "/api/v1/items/most_revenue?quantity=#{x}"
  end

end
