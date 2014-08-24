# == Schema Information
#
# Table name: postings
#
#  id              :integer          not null, primary key
#  quantity        :decimal(, )
#  unit            :string(255)
#  price_per_unit  :decimal(, )
#  starting_date   :date
#  expiration_date :date
#  product_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :posting do
    quantity { rand(100) + 10 }
    unit { %w(lbs pounds flats quarts pints bushels).sample }
    price_per_unit { rand(1.0..40.0) }
    starting_date { ((Date.today - 4.weeks)..(Date.today + 2.weeks)).to_a.sample }
    expiration_date { starting_date + rand(15).days }
  end
end
