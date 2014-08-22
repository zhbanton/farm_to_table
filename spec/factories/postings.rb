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
