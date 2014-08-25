class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true
      t.references :posting, index: true
      t.decimal :quantity
      t.date :pickup_date
      t.decimal :cost

      t.timestamps
    end
  end
end
