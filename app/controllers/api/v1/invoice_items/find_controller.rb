class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    if params[:id]
      render json: InvoiceItem.where(id: params[:id])
    elsif params[:quantity]
      render json: InvoiceItem.where(quantity: params[:quantity])
    elsif params[:unit_price]
      render json: InvoiceItem.where(unit_price: params[:unit_price])
    elsif params[:created_at]
      render json: InvoiceItem.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: InvoiceItem.where(updated_at: params[:updated_at])
    end
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  private
  def invoice_item_params
    params.permit(:id, :quantity, :invoice_id, :item_id, :unit_price, :updated_at, :created_at)
  end
end
