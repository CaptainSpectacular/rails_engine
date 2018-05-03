class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  def show
    render json: Merchant.find(params[:id]).customers_with_pending_invoices
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> fixing tests
=======
>>>>>>> adding in customers with pending invoices
=======

>>>>>>> 78dd23db9939034dca3230280ee4b6df0f86be85
  end
end
