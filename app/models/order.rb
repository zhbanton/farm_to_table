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

end
