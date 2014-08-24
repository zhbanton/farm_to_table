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

  has_one :user, as: :role, dependent: :destroy
  has_many :business_days, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :postings, through: :products
  accepts_nested_attributes_for :business_days, reject_if: proc { |attributes| attributes['opening_time'].empty? || attributes['closing_time'].empty? }, allow_destroy: true

  validates :minimum_order, numericality: true

  def active_postings_by_date
    postings.where('expiration_date >= ?', Date.today).order(:starting_date, :expiration_date)
  end

  def active_postings_by_name
    postings.includes(:product).where('postings.expiration_date >= ?', Date.today).order('products.name', :starting_date)
  end

  def inactive_postings
    postings.where('expiration_date < ?', Date.today).order(expiration_date: :desc)
  end

end
