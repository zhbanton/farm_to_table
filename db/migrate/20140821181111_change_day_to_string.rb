class ChangeDayToString < ActiveRecord::Migration
  def up
    change_column :business_hours, :day, :string
  end

  def down
    change_column :business_hours, :day, :integer
  end
end
