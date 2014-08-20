class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :business_type

      t.timestamps
    end
  end
end
