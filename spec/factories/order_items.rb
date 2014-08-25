# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    order nil
    posting nil
    quantity "9.99"
    pickup_date "2014-08-24"
    cost "9.99"
  end
end
