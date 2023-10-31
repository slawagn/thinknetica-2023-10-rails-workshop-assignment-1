class CreateProductAccesses < ActiveRecord::Migration[7.1]
  def change
    create_table :product_accesses do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
