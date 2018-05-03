class Api::V1::Customers::TransactionController < ApplicationController
  def show
    render json: Customer.find(params[:id]).transactions
  end
end
