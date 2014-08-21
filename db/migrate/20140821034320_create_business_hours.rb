class CreateBusinessHours < ActiveRecord::Migration
  def change
    create_table :business_hours do |t|
      t.integer :day
      t.string :opening_time
      t.string :closing_time
      t.references :farm, index: true

      t.timestamps
    end
  end
end
