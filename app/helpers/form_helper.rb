module FormHelper

  # available hours for farm to be open for pickup
  def available_hours
    hours = (4..11).map { |t| "#{t}:00am"}.push("12:00pm") + (1..10).map { |t| "#{t}:00pm"}
    half_hours = (4..11).map { |t| "#{t}:30am"}.push("12:30pm") + (1..10).map { |t| "#{t}:30pm"}
    hours.zip(half_hours).flatten.push("11:00pm").unshift('')
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
