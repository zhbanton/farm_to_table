class FarmSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :website, :phone_number, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours

  def name
    "#{object.user.name}"
  end

  def description
    "#{object.user.description}"
  end

  def website
    "#{object.user.website}"
  end

  def phone_number
    "#{object.user.phone_number}"
  end

  def monday_hours
    business_hours("Monday")
  end

  def tuesday_hours
    business_hours("Tuesday")
  end

  def wednesday_hours
    business_hours("Wednesday")
  end

  def thursday_hours
    business_hours("Thursday")
  end

  def friday_hours
    business_hours("Friday")
  end

  def saturday_hours
    business_hours("Saturday")
  end

  def sunday_hours
    business_hours("Sunday")
  end

  private

  def business_hours(day_string)
    day = object.business_days.where(day: day_string).first
    day.present? ? "#{day.opening_time.strftime("%-I:%M %p")} - #{day.closing_time.strftime("%-I:%M %p")}" : "closed"
  end

end
