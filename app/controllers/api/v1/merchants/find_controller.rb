class Api::V1::Merchants::FindController < ApplicationController
  def show
    case 
    when params[:id]   then render json: Merchant.find(params[:id])
    when params[:name] then render json: Merchant.find_by(name: params[:name])
    end
  end

  def index
    case
    when params[:id]         then render json: Merchant.where(id: params[:id])
    when params[:name]       then render json: Merchant.where(name: params[:name])
    when params[:created_at] then render json: Merchant.where(created_at: params[:created_at])
    when params[:updated_at] then render json: Merchant.where(updated_at: params[:updated_at])
    end
  end
end
