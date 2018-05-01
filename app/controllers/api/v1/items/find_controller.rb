class Api::V1::Items::FindController < ApplicationController
  def index
    if params[:name]
      render json: Item.where(name: params[:name])
    elsif params[:description]
      render json: Item.where(description: params[:description])
    elsif params[:unit_price]
      render json: Item.where(unit_price: params[:unit_price])
    end
  end

  def show
    if params[:id]
      render json: Item.find(params[:id])
    elsif params[:name]
      render json: Item.find_by(name: params[:name])
    elsif params[:description]
      render json: Item.find_by(description: params[:description])
    elsif params[:unit_price]
      render json: Item.find_by(unit_price: params[:unit_price])
    end
  end
end
