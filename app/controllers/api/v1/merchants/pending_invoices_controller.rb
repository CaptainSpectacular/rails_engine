class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  def show
    render json: Merchant.find(params[:id]).customers_with_pending_invoices
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> fixing tests
=======
>>>>>>> adding in customers with pending invoices
  end
end
