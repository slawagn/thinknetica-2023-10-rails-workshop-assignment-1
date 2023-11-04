class PaymentsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    purchase_result = PurchaseProduct.call(product: product, user: current_user)

    if purchase_result.success?
      redirect_to action: :successful_payment
    else
      redirect_to action: :failed_payment, error: purchase_result.error
    end
  end

  def successful_payment
    render json: { status: 'Order placed successfully!' }
  end

  def failed_payment
    failure_reason =
      case params[:error]&.to_sym
      when :failed_cloud_payment
        'failed cloud payment'
      when :delivery_setup_failure
        'delivery setup failure'
      else
        'unknown reason'
      end

    render json: { status: "Failed to place order due to #{failure_reason}" }
  end
end
