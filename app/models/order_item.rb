# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  posting_id  :integer
#  quantity    :decimal(, )
#  pickup_date :date
#  cost        :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :posting
end
