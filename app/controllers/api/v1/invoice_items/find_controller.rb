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
    if params[:id]
      render json: InvoiceItem.find(params[:id])
    elsif params[:quantity]
      render json: InvoiceItem.find_by(quantity: params[:quantity])
    elsif params[:unit_price]
      render json: InvoiceItem.find_by(unit_price: params[:unit_price])
    elsif params[:created_at]
      render json: InvoiceItem.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: InvoiceItem.find_by(updated_at: params[:updated_at])
    end
  end
end
