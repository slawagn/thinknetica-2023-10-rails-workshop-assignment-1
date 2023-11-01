class Delivery < ApplicationRecord
  def rollback!
    destroy!
  end
end
