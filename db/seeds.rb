# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  FactoryGirl.create(:user)
end

Farm.all.each do |farm|
  farm.products = FactoryGirl.create_list(:product, rand(12))
  business_days_array = [BusinessDay.create!(day: 'Monday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM')),
                        BusinessDay.create!(day: 'Tuesday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM')),
                        BusinessDay.create!(day: 'Thursday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM')).
                        BusinessDay.create!(day: 'Friday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM')),
                        BusinessDay.create!(day: 'Saturday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM'))]
  farm.business_days = business_days_array
end

Product.all.each do |product|
  product.postings = FactoryGirl.create_list(:posting, rand(6))
end
