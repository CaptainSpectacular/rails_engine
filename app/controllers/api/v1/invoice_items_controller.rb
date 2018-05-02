class Api::V1::InvoiceItemsController < ApplicationController

  def index
    case params[:invoice_id].nil?
    when false then render json: InvoiceItem.where(invoice_id: params[:invoice_id])
    else render json: InvoiceItem.all
    end
  end

  def show
    if params[:id]
      render json: InvoiceItem.find(params[:id])
    end
  end
end
