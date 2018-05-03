class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    if params[:unit_price]
       render json: InvoiceItem.where(unit_price: (params[:unit_price].delete('.')))
    else
      render json: InvoiceItem.where(invoice_item_params)
    end
  end

  def show
    
    if params[:unit_price]
       render json: InvoiceItem.find_by(unit_price: (params[:unit_price].delete('.')))
    else
      render json: InvoiceItem.find_by(invoice_item_params)
    end
  end

  private
  def invoice_item_params
    params.permit(:id, :quantity, :invoice_id, :item_id, :unit_price, :updated_at, :created_at)
  end
end
