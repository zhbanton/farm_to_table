# == Schema Information
#
# Table name: postings
#
#  id              :integer          not null, primary key
#  quantity        :decimal(, )
#  unit            :string(255)
#  price_per_unit  :decimal(, )
#  starting_date   :date
#  expiration_date :date
#  product_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Posting < ActiveRecord::Base

  belongs_to :product
  belongs_to :farm
  has_many :order_items, dependent: :destroy

  validates :quantity, :unit, :price_per_unit, :starting_date, :expiration_date, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  def total_value
    price_per_unit * quantity
  end

  def last_associated_posting_unit
    product.postings.length > 1 ? last_associated_posting.unit : nil
  end

  def last_associated_posting_price
    product.postings.length > 1 ? last_associated_posting.price_per_unit : nil
  end

  def last_associated_posting
    product.postings.order(:created_at).last
  end

  def available_pickup_days_after_given_date(date)
    return false if self.expiration_date < date
    (self.starting_date..self.expiration_date).find_all do |day|
      product.farm.business_days.map(&:day).include? day.strftime("%A")
    end
  end

  def quantity_remaining
    self.order_items.present? ? self.quantity - order_items.map(&:quantity).reduce(:+) : self.quantity
  end

end

