# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  is_completed    :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    organization nil
    is_completed false
  end
end
