class Api::V1::Customers::InvoiceController < ApplicationController
  def show
    render json: Customer.find(params[:id]).invoices
  end
end
