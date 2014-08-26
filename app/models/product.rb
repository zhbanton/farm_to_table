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

  include ActivePosting

  belongs_to :farm
  has_many :postings

  validates :name, presence: true

end
