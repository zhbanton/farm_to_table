class AddDefaultQuantityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :default_unit, :string
  end
end
