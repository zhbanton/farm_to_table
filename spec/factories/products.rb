# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  variety       :string(255)
#  description   :text
#  organic       :boolean
#  non_gmo       :boolean
#  no_spray      :boolean
#  low_spray     :boolean
#  farm_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  default_price :decimal(, )
#  default_unit  :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name { %w( Strawberries Blueberries Potatoes Kale Lettuce Chard Tomatoes Corn Eggs Peaches Scallions Onions Garlic Zucchini Squash Cheese Pork Chicken Beef Cilantro Basil Sage Oregano Thyme Nectarines Plums Watermelon Yams Broccoli Okra).sample }
    variety { %w(great ok).sample }
    description { Faker::Lorem.sentence }
    organic { [true, false].sample }
    non_gmo { [true, false].sample }
    no_spray { [true, false].sample }
    low_spray { [true, false].sample }
  end
end
