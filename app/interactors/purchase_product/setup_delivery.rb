class PurchaseProduct::SetupDelivery
  include Interactor

  def call
    setup_delivery
    validate_delivery_setup
    save_delivery_info
  end

  def rollback
    unsetup_delivery
    update_delivery_status_to_cancelled
  end

  private

  def setup_delivery
    context.delivery_setup_result = Sdek::RequestDeliverySetup.call(
      address: 'user.address',
      person: 'user.person',
      weight: 'product.weight'
    )
  end

  def validate_delivery_setup
    return unless context.delivery_setup_result.success?

    context.fail!(error: :delivery_setup_failure)
  end

  def save_delivery_info
    context.delivery = Delivery.create!(
      address: 'user.address',
      person: 'user.person',
      weight: 'product.weight'
    )
  end

  def unsetup_delivery
    Sdek::RequestDeliveryCancel.call(context.delivery_setup_result[:delivery_id])
  end

  def update_delivery_status_to_cancelled
    context.delivery.cancel!
  end
end
