class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
  end

  def show
    case params[:invoice_id].nil?
    when false then render json: Invoice.find(params[:invoice_id]).merchant
    else render json: Merchant.find(params[:id])
    end
  end
end
