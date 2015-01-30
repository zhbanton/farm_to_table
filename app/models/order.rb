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
    order_items_with_farm.each do |item|
      if items_by_farm.has_key? Farm.find(item.farm_id)
        items_by_farm[Farm.find(item.farm_id)] << item
      else
        items_by_farm[Farm.find(item.farm_id)] = [item]
      end
    end
    items_by_farm
  end

  def subtotal
    order_items.map(&:total_cost).reduce(0, &:+)
  end

  def farms
    order_items.map { |item| item.posting.product.farm.user.name }.inject(Hash.new(0)) { |h,v| h[v] += 1; h }.sort_by { |k,v| v }.reverse.map { |arr| arr[0] }
  end

  private

  def order_items_with_farm
    order_items.select('farms.id as farm_id, order_items.*')
    .joins(posting: {product: {farm: :user}})
    .order('products.name', 'products.variety')
  end

end
