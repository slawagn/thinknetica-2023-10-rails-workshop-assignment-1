class AddStatusToDelivery < ActiveRecord::Migration[7.1]
  def change
    add_column :deliveries, :status, :string
  end
end
