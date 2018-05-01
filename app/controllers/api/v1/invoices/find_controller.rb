class Api::V1::Invoices::FindController < ApplicationController

  def index
    if params[:status]
      render json: Invoice.where(status: params[:status])
    elsif params[:created_at]
      render json: Invoice.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Invoice.where(updated_at: params[:updated_at])
    end
  end


  def show
    if params[:id]
      render json: Invoice.find(params[:id])
    elsif params[:status]
      render json: Invoice.find_by(status: params[:status])
    elsif params[:created_at]
      render json: Invoice.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Invoice.find_by(updated_at: params[:updated_at])
    end
  end

end
