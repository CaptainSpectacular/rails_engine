class Api::V1::TransactionsController < ApplicationController
  def index
    case params[:invoice_id].nil?
    when true then render json: Transaction.all
    else render json: Transaction.where(invoice_id: params[:invoice_id])
    end
  end

  def show
    render json: Transaction.find(params[:id])
  end
end
