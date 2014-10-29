# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  variety            :string(255)
#  description        :text
#  organic            :boolean
#  non_gmo            :boolean
#  no_spray           :boolean
#  low_spray          :boolean
#  farm_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  default_price      :decimal(, )
#  default_unit       :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Product < ActiveRecord::Base

  include ActivePosting

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  belongs_to :farm
  has_many :postings
  has_many :order_items, through: :postings

  validates :name, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
