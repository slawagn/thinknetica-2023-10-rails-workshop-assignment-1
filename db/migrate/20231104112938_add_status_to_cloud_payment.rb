class AddStatusToCloudPayment < ActiveRecord::Migration[7.1]
  def change
    add_column :cloud_payments, :status, :string
  end
end
