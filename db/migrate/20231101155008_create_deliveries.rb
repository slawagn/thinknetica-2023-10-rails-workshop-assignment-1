class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :address
      t.string :person
      t.integer :weight

      t.timestamps
    end
  end
end
