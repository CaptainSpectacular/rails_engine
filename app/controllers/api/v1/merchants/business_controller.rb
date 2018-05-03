class Api::V1::Merchants::BusinessController < ApplicationController
  def index
    render json: Merchant.most_items(params[:quantity])
  end
end
