class ChangeRolableToRole < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.remove :rolable_id
      t.remove :rolable_type
      t.references :role, polymorphic: true, index: true
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :role_id
      t.remove :role_type
      t.references :rolable, polymorphic: true, index: true
    end
  end
end
