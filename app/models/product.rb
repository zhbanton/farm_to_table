# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  variety       :string(255)
#  description   :text
#  organic       :boolean
#  non_gmo       :boolean
#  no_spray      :boolean
#  low_spray     :boolean
#  farm_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  default_price :decimal(, )
#  default_unit  :string(255)
#

class Product < ActiveRecord::Base

  belongs_to :farm
  has_many :postings

  validates :name, presence: true

  def active_postings
    postings.where('expiration_date >= ?', Date.today).order(:starting_date, :expiration_date)
  end

  def inactive_postings
    postings.where('expiration_date < ?', Date.today).order(expiration_date: :desc)
  end

end
