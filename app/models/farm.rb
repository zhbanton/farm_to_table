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

  validates :minimum_order, numericality: true

end
