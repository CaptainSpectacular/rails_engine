class Api::V1::ItemsController < ApplicationController
  def index
    case params[:invoice_id].nil?
    when false then render json: Invoice.find(params[:invoice_id]).items 
    else render json: Item.all
    end
  end

  def show
    render json: Item.find(params[:id])
  end
end
