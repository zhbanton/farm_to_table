class ChangeQuantityAndPriceStorageOnOrderItems < ActiveRecord::Migration

  def up
    remove_column :order_items, :cost
    add_column :order_items, :price_per_unit, :decimal
    add_column :order_items, :unit, :string
  end

  def down
    add_column :order_items, :cost, :decimal
    remove_column :order_items, :price_per_unit
    remove_column :order_items, :unit
  end

end
