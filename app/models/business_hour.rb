
# == Schema Information
#
# Table name: business_hours
#
#  id           :integer          not null, primary key
#  day          :integer
#  opening_time :string(255)
#  closing_time :string(255)
#  farm_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class BusinessHour < ActiveRecord::Base

  belongs_to :farm

end
