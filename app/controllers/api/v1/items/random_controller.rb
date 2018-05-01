class Api::V1::Items::RandomController < ApplicationController
  def show
    render json: Item.order("random()").first
  end
end
