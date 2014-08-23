# == Schema Information
#
# Table name: postings
#
#  id             :integer          not null, primary key
#  quantity       :decimal(, )
#  unit           :string(255)
#  price_per_unit :decimal(, )
#  starting_date  :date
#  ending_date    :date
#  product_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'rails_helper'

RSpec.describe Posting, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
