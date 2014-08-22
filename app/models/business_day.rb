# == Schema Information
#
# Table name: business_days
#
#  id           :integer          not null, primary key
#  day          :string(255)
#  opening_time :string(255)
#  closing_time :string(255)
#  farm_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class BusinessDay < ActiveRecord::Base

  belongs_to :farm

end
