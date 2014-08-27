class ChangeBusinessTimeToTime < ActiveRecord::Migration
  def up
    remove_column :business_days, :opening_time
    remove_column :business_days, :closing_time
    add_column :business_days, :opening_time, :time
    add_column :business_days, :closing_time, :time
  end

  def down
    remove_column :business_days, :closing_time
    remove_column :business_days, :closing_time
    add_column :business_days, :opening_time, :string
    add_column :business_days, :closing_time, :string
  end
end
