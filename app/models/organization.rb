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
  has_one :user, as: :rolable
end
