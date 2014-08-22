class AddDefaultPriceAndVarietyIndexToProducts < ActiveRecord::Migration
  def change
    add_column :products, :default_price, :decimal
    add_index :products, :variety
  end
end
