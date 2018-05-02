class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  private
  def invoice_item_params
    params.permit(:id, :quantity, :invoice_id, :item_id, :unit_price, :updated_at, :created_at)
  end
end
