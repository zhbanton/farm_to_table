class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :organization, index: true
      t.boolean :is_completed

      t.timestamps
    end
  end
end
