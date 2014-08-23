# == Schema Information
#
# Table name: postings
#
#  id             :integer          not null, primary key
#  quantity       :decimal(, )
#  unit           :string(255)
#  price_per_unit :decimal(, )
#  starting_date  :date
#  ending_date    :date
#  product_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :posting do
    quantity "9.99"
    unit "MyString"
    price_per_unit "9.99"
    starting_date "2014-08-22"
    ending_date "2014-08-22"
  end
end
