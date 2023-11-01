class PurchaseProduct::NotifyUser
  include Interactor

  def call
    OrderMailer.product_purchased_email(context.product_access, context.delivery).deliver_later
  end
end
