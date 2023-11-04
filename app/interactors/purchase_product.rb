class PurchaseProduct
  include Interactor::Organizer

  organize PurchaseProduct::ProcessPayment,
    PurchaseProduct::SetupDelivery,
    PurchaseProduct::NotifyUser
end
