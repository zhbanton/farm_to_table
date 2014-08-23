module FormHelper

  include ActionView::Helpers::NumberHelper

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

  def set_posting_default_price_and_unit(posting)
    posting.unit = posting.product.default_unit.present? ? posting.product.default_unit : posting.last_associated_posting_unit
    posting.price_per_unit = posting.product.default_price.present? ? posting.product.default_price : posting.last_associated_posting_price
    posting
  end

  def quantity_to_s(quantity, unit)
    "#{quantity} #{unit.pluralize}"
  end

  def name_and_variety_to_s(name, variety)
    "#{name} (#{variety})"
  end

end
