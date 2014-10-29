# == Schema Information
#
# Table name: business_days
#
#  id           :integer          not null, primary key
#  day          :string(255)
#  farm_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  opening_time :time
#  closing_time :time
#

class BusinessDay < ActiveRecord::Base

  belongs_to :farm

  validates_uniqueness_of :day, { scope: :farm_id }
  validate :opening_before_closing

  private

  def opening_before_closing
    if self.opening_time > self.closing_time
      errors.add(:closing_time, "cannot be before opening time")
    end
  end

end
