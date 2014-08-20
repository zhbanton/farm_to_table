class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.decimal :minimum_order

      t.timestamps
    end
  end
end
