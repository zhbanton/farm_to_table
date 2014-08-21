module FormHelper
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

  def setup_rolable(rolable)
    if rolable.class.name == 'Farm'
      Date::DAYNAMES.each do |day|
        unless rolable.business_hours.map(&:day).include? day
          rolable.business_hours.build(day: day)
        end
      end
      ordered_days = rolable.business_hours.sort_by { |bh| Date.parse(bh.day) }
      @business_hours = ordered_days.push(ordered_days.shift)
    end
    rolable
  end

end
