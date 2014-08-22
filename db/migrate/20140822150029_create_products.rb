class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, index: true
      t.string :variety
      t.text :description
      t.boolean :organic
      t.boolean :non_gmo
      t.boolean :no_spray
      t.boolean :low_spray
      t.references :farm, index: true

      t.timestamps
    end
  end
end
