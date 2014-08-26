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

  def order_items_by_farm
    items_by_farm = {}
    order_items.select('users.name as farm_name, order_items.*').joins(posting: [product: [farm: [:user]]]).each do |item|
      items_by_farm[item.farm_name] = item
    end
    items_by_farm
  end

end
