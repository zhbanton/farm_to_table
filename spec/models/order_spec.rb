# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  is_completed    :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe Order, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
