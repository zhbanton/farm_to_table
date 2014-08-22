module FormHelper

  # available hours for farm to be open for pickup
  def available_hours
  [
    "",
    "5:00am",
    "5:30am",
    "6:00am",
    "6:30am",
    "7:00am",
    "7:30am",
    "8:00am",
    "8:30am",
    "9:00am",
    "9:30am",
    "10:00am",
    "10:30am",
    "11:00am",
    "11:30am",
    "12:00pm",
    "12:30pm",
    "1:00pm",
    "1:30pm",
    "2:00pm",
    "2:30pm",
    "3:00pm",
    "3:30pm",
    "4:00pm",
    "4:30pm",
    "5:00pm",
    "5:30pm",
    "6:00pm",
    "6:30pm",
    "7:00pm",
    "7:30pm",
    "8:00pm",
    "8:30pm",
    "9:00pm",
    "9:30pm",
    "10:00pm",
    "10:30pm",
    "11:00pm"]
  end

  # create available business_hours for farm if they do not already exist
  def setup_role(role)
    if role.class.name == 'Farm'
      Date::DAYNAMES.each do |day|
        unless role.business_days.map(&:day).include? day
          role.business_days.build(day: day)
        end
      end
      # return business_days sorted by day of week
      ordered_days = role.business_days.sort_by { |bh| Date.parse(bh.day) }
      @business_days = ordered_days.push(ordered_days.shift)
    end
    role
  end

end
