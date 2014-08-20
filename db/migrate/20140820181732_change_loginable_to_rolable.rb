class ChangeLoginableToRolable < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.remove :loginable_id
      t.remove :loginable_type
      t.references :rolable, polymorphic: true, index: true
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :rolable_id
      t.remove :rolable_type
      t.references :loginable, polymorphic: true, index: true
    end
  end
end
