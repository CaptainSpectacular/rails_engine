class Api::V1::Items::SoldController < ApplicationController

  def index
    render json: Item.most_sold(params[:quantity])
  end
end
