class AddCostToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :cost, :integer
  end
end
