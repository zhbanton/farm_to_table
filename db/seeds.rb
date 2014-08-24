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
  FactoryGirl.create_list(:product, rand(12))
end

Product.all.each do |product|
  FactoryGirl.create_list(:posting, rand(6))
end
