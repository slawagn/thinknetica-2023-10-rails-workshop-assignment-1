class CreateCloudPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :cloud_payments do |t|
      t.integer :user_uid
      t.integer :amount_cents
      t.string :currency

      t.timestamps
    end
  end
end
