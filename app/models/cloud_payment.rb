class CloudPayment < ApplicationRecord
  def self.process(user_uid:, amount_cents:, currency:)
    cloud_payment = CloudPayment.create(
      user_uid: user_uid,
      amount_cents: amount_cents,
      currency: currency,
      status: :completed
    )

    return { status: :failed } unless cloud_payment.persisted?

    if gateway_failed?
      cloud_payment.update(status: :failed)

      return { status: :failed }
    end

    {
      status: :completed,
      record: cloud_payment
    }
  end

  def rollback!
    # Request gateway to undo the payment

    update!(status: :rolled_back)
  end

  private

  def gateway_failed?
    [0, 1, 2].sample == 0
  end
end
