class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.decimal :quantity
      t.string :unit
      t.decimal :price_per_unit
      t.date :starting_date
      t.date :ending_date
      t.references :product, index: true

      t.timestamps
    end
  end
end
