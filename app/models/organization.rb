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
  has_many :orders, dependent: :destroy
  has_many :order_items, through: :orders

  def active_orders
    orders.(is_completed: true).find_all { |o| o.last_pickup_date > Date.today }
  end

end
