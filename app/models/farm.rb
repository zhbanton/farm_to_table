# == Schema Information
#
# Table name: farms
#
#  id            :integer          not null, primary key
#  minimum_order :decimal(, )
#  created_at    :datetime
#  updated_at    :datetime
#

class Farm < ActiveRecord::Base
  has_one :user, as: :rolable

  validates :minimum_order, numericality: true
end
