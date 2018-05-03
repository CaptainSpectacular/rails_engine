class Api::V1::Merchants::DateRevenueController < ApplicationController
  def show
    render json: Merchant.total_revenue_for_date(params[:date]), serializer: DateRevenueSerializer
  end
end
