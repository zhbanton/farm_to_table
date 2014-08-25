class Order < ActiveRecord::Base

  belongs_to :organization
  has_many :order_items, dependent: :destroy

end
