# == Schema Information
#
# Table name: order_items
#
#  id             :integer          not null, primary key
#  order_id       :integer
#  posting_id     :integer
#  quantity       :decimal(, )
#  pickup_date    :date
#  created_at     :datetime
#  updated_at     :datetime
#  price_per_unit :decimal(, )
#  unit           :string(255)
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :posting

  validates :quantity, :pickup_date, :price_per_unit, :unit, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validate :quantity_remaining_greater_than_zero

  def total_cost
    quantity * price_per_unit
  end

  def quantity_remaining_greater_than_zero
    if posting.quantity_remaining - self.quantity < 0
      errors.add(:quantity, "can't exceed amount farm has in stock")
    end
  end

end
