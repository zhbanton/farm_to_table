class BusinessHours < ActiveRecord::Base
  belongs_to :farm

  def self.hours_select
    hours = (5..11).map { |t| "#{t}:00 AM"}.push('12:00 PM') + (1..10).map { |t| "#{t}:00PM"}
    half_hours = (5..11).map { |t| "#{t}:30 AM"}.push('12:30 PM') + (1..10).map { |t| "#{t}:30PM"}
    hours.zip(half_hours).flatten.push('11:00 PM')
  end

end
