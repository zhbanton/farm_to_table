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
  validates :business_type, inclusion: { in: BUSINESS_TYPES }
  validates :user, presence: true

  def active_orders
    orders.where(is_completed: true).find_all { |o| o.last_pickup_date > Date.today }
  end

  # create nested hash of all order items, 1st key as pickup date, 2nd key as farm name, maps to all order items
  def order_items_by_pickup_date
    items_by_pickup = {}
    order_items_with_farm.each do |item|
      if items_by_pickup.has_key? item.pickup_date.to_s
        create_or_add_to_farm_name(items_by_pickup, item)
      else
        items_by_pickup[item.pickup_date.to_s] = {}
        items_by_pickup[item.pickup_date.to_s][item.farm_name] = [item]
      end
    end
    items_by_pickup
  end

  private

  def order_items_with_farm
    order_items.select('users.name as farm_name, order_items.*')
    .joins(posting: {product: {farm: :user}})
    .where('orders.is_completed = true AND order_items.pickup_date >= ?', Date.today)
    .order('order_items.pickup_date', 'products.name', 'products.variety')
  end

  def create_or_add_to_farm_name(items_by_pickup, item)
    if items_by_pickup[item.pickup_date.to_s].has_key? item.farm_name
      items_by_pickup[item.pickup_date.to_s][item.farm_name] << item
    else
      items_by_pickup[item.pickup_date.to_s][item.farm_name] = [item]
    end
  end

end
