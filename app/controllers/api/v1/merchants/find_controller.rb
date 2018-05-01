class Api::V1::Merchants::FindController < ApplicationController
  def show
    render json: Merchant.search(params)
  end

  def index
    render json: Merchnat.search_all(params)    
  end
end
