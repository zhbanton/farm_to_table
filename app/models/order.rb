# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  is_completed    :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

class Order < ActiveRecord::Base

  belongs_to :organization
  has_many :order_items, dependent: :destroy

  def last_pickup_date
    order_items.order(:pickup_date).last.pickup_date
  end

  # create hash of all order items, key as farm name, maps to all order items
  def order_items_by_farm
    items_by_farm = {}
    order_items.select('users.name as farm_name, order_items.*').joins(posting: [product: [farm: [:user]]]).each do |item|
      if items_by_farm.has_key? item.farm_name
        items_by_farm[item.farm_name] << item
      else
        items_by_farm[item.farm_name] = [item]
      end
    end
    items_by_farm
  end

end
