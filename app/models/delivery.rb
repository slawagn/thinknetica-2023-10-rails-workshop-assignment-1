class Delivery < ApplicationRecord
  def cancel!
    update!(status: :cancelled)
  end
end
