class PurchaseProduct::ProcessPayment
  include Interactor

  def call
    process_payment
    validate_payment
    grant_access_to_product
  end

  def rollback
    context.product_access.destroy!
    context.payment_result[:record].rollback!
  end

  private

  def process_payment
    context.payment_result = CloudPayment.process(
      user_uid: context.user.cloud_payments_uid,
      amount_cents: context.product.cost,
      currency: 'RUB'
    )
  end

  def validate_payment
    return if context.payment_result[:status] == :completed

    context.fail!(error: :failed_cloud_payment)
  end

  def grant_access_to_product
    context.product_access = ProductAccess.create(user: context.user, product: context.product)
  end
end
