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

require 'rails_helper'

RSpec.describe OrderItem, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
