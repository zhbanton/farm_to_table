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
  BusinessDay.create!(farm_id: farm.id, day: 'Monday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM'))
  BusinessDay.create!(farm_id: farm.id, day: 'Tuesday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM'))
  BusinessDay.create!(farm_id: farm.id, day: 'Thursday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM'))
  BusinessDay.create!(farm_id: farm.id, day: 'Friday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM'))
  BusinessDay.create!(farm_id: farm.id, day: 'Saturday', opening_time: Time.parse('5:30AM'), closing_time: Time.parse('6:30PM'))
end

Product.all.each do |product|
  product.postings = FactoryGirl.create_list(:posting, rand(6))
end
