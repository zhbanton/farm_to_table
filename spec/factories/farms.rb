# == Schema Information
#
# Table name: farms
#
#  id            :integer          not null, primary key
#  minimum_order :decimal(, )
#  created_at    :datetime
#  updated_at    :datetime
#

FactoryGirl.define do
  factory :farm do
    minimum_order 100
  end
end
