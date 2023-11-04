class Sdek::RequestDeliverySetup
  include Interactor

  def call
    puts <<~INFO
      Setting up delivery
      Address: #{context.address}
      Person: #{context.person}
      Weight: #{context.weight}
    INFO

    context.fail!(error: :failed_delivery_request) if request_failed?
  end

  private

  def request_failed?
    [0, 1, 2].sample == 0
  end
end
