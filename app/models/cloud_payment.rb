class CloudPayment < ApplicationRecord
  def self.process(user_uid:, amount_cents:, currency:)
    return { status: :failed } if amount_cents == 0
    
    cloud_payment = CloudPayment.create(user_uid: user_uid, amount_cents: amount_cents, currency: currency)

    if cloud_payment.persisted?
      {
        status: :completed,
        record: cloud_payment
      }
    else
      {
        status: :failed
      }
    end
  end
end
