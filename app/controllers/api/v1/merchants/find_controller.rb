class Api::V1::Merchants::FindController < ApplicationController
  def show
    render json: Merchant.search(params)
  end

  def index
    render json: Merchant.search_all(params)    
  end
end
