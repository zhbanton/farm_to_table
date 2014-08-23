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

  validates :quantity, :unit, :price_per_unit, :starting_date, :expiration_date, presence: true

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

end

