class Api::V1::Transactions::FindController < ApplicationController
  def show
    render json: Transaction.find_by(trans_params)
  end

  def index
    render json: Transaction.where(trans_params)
  end

  private

  def trans_params
    params.permit(:id, :created_at, :updated_at, :invoice_id, :credit_card_number, :result)
  end
end
