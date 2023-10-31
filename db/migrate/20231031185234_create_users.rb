class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :cloud_payments_uid

      t.timestamps
    end
  end
end
