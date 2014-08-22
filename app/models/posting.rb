class Posting < ActiveRecord::Base

  belongs_to :product
  belongs_to :farm

end

