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

class Posting < ActiveRecord::Base

  belongs_to :product
  belongs_to :farm

end

