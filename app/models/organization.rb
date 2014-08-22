# == Schema Information
#
# Table name: organizations
#
#  id            :integer          not null, primary key
#  business_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Organization < ActiveRecord::Base

  BUSINESS_TYPES = ['restaurant', 'caterer', 'educational', 'business', 'charitable', 'other']

  has_one :user, as: :role, dependent: :destroy

end
