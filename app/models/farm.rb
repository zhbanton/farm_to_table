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

  has_one :user, as: :role
  has_many :business_days, dependent: :destroy
  accepts_nested_attributes_for :business_days, reject_if: proc { |attributes| attributes['opening_time'].empty? || attributes['closing_time'].empty? }, allow_destroy: true

  validates :minimum_order, numericality: true

end
