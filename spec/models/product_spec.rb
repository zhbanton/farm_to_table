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

require 'rails_helper'

RSpec.describe Product, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
