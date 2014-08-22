class RenameBusinessHoursToBusinessDays < ActiveRecord::Migration
  def self.up
    rename_table :business_hours, :business_days
  end
  def self.down
    rename_table :business_days, :business_hours
  end
end
