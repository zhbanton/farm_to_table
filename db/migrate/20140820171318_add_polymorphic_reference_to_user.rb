class AddPolymorphicReferenceToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :loginable, polymorphic: true, index: true
    end
  end
end
