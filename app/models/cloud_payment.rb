class CloudPayment < ApplicationRecord
  def self.process(user_uid:, amount_cents:, currency:)
    return { status: :failed } if [0, 1].sample == 1
    
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
