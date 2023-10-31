class Sdek::SetupDelivery
  include Interactor

  def call
    puts <<~INFO
      Setting up delivery
      Address: #{context.address}
      Person: #{context.person}
      Weight: #{context.weight}
    INFO
  end
end
