class PaymentsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    payment_result = CloudPayment.process(
      user_uid: current_user.cloud_payments_uid,
      amount_cents: params[:amount],
      currency: 'RUB'
    )

    if payment_result[:status] == :completed
      product_access = ProductAccess.create(user: current_user, product: product)
      OrderMailer.product_access_email(product_access).deliver_later
      redirect_to action: :successful_payment
    else
      redirect_to action: :failed_payment
    end
  end

  def successful_payment
    render json: { status: 'Order placed successfully!' }
  end

  def failed_payment
    render json: { status: 'Failed to place order :(' }
  end
end
