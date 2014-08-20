class AddSharedColumnsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name, null: false
      t.text :description
      t.string :website
      t.integer :phone_number
    end
  end
end
