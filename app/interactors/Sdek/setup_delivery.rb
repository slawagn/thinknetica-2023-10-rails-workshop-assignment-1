class Sdek::SetupDelivery
  include Interactor

  def call
    puts <<~INFO
      Setting up delivery
      Address: #{context.address}
      Person: #{context.person}
      Weight: #{context.weight}
    INFO

    case [0, 1].sample
    when 0
      { result: :failed }
    when 1
      { result: :succeeded }
    end
  end
end
