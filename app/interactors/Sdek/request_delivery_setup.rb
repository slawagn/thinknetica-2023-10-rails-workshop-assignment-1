class Sdek::RequestDeliverySetup
  include Interactor

  def call
    puts <<~INFO
      Setting up delivery
      Address: #{context.address}
      Person: #{context.person}
      Weight: #{context.weight}
    INFO

    context.fail!(error: :failed_delivery_request) if [0, 1, 2].sample == 0
  end
end
