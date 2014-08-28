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

  include ActivePosting

  has_one :user, as: :role, dependent: :destroy
  has_many :business_days, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :postings, through: :products
  has_many :order_items, through: :postings

  accepts_nested_attributes_for :business_days, reject_if: proc { |attributes| attributes['opening_time'].empty? || attributes['closing_time'].empty? }, allow_destroy: true

  validates :minimum_order, numericality: true, allow_blank: true
  validates :user, presence: true

  def order_items_by_pickup_date
    items_by_pickup = {}
    order_items_with_organization.each do |item|
      if items_by_pickup.has_key? item.pickup_date.to_s
        create_or_add_to_organization_name(items_by_pickup, item)
      else
        items_by_pickup[item.pickup_date.to_s] = {}
        items_by_pickup[item.pickup_date.to_s][item.organization_name] = [item]
      end
    end
    items_by_pickup
  end

  private

  def order_items_with_organization
    order_items.select('users.name as organization_name, order_items.*')
    .joins(order: {organization: :user})
    .where('orders.is_completed = true AND order_items.pickup_date >= ?', Date.today)
    .order('order_items.pickup_date', 'products.name', 'products.variety')
  end

  def create_or_add_to_organization_name(items_by_pickup, item)
    if items_by_pickup[item.pickup_date.to_s].has_key? item.organization_name
      items_by_pickup[item.pickup_date.to_s][item.organization_name] << item
    else
      items_by_pickup[item.pickup_date.to_s][item.organization_name] = [item]
    end
  end

end
