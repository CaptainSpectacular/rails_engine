class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all\
  end

  def show
    case params[:invoice_id].nil?
    when false then render json: Invoice.find(params[:invoice_id]).customer
    else render json: Customer.find(params[:id])
    end
  end
end
