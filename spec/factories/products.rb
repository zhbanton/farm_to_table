# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  variety     :string(255)
#  description :text
#  organic     :boolean
#  non_gmo     :boolean
#  no_spray    :boolean
#  low_spray   :boolean
#  farm_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    variety "MyString"
    description "MyText"
    organic false
    non_gmo false
    no_spray false
    low_spray false
    farm nil
  end
end
