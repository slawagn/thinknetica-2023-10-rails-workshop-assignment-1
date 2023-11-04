class Sdek::RequestDeliveryCancel
  include Interactor

  def call
    puts "Unsetupped delivery #{context.delivery_id}"
  end
end
