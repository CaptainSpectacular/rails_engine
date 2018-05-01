class Api::V1::Invoices::RandomController < ApplicationController
  def show
    render json: Invoice.order("random()").first
  end
end
