module FormHelper

require 'date'
ActionView::Helpers::NumberHelper

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

  def setup_order_item(order, posting)
    associated_items = order.order_items.where(posting: posting)
    if associated_items.present?
      return associated_items.first
    end
    OrderItem.new
  end


  def set_posting_default_price_and_unit(posting)
    posting.unit = posting.product.default_unit.present? ? posting.product.default_unit : posting.last_associated_posting_unit
    posting.price_per_unit = posting.product.default_price.present? ? posting.product.default_price : posting.last_associated_posting_price
    posting
  end

  def quantity_to_s(object)
    "#{object.quantity} #{object.unit.pluralize}"
  end

  def quantity_per_unit(object)
    "#{number_to_currency(object.price_per_unit)}/#{object.unit.singularize}"
  end

  def name_and_variety_to_s(product)
    "#{product.name.capitalize} (#{product.variety})"
  end

  def qualifications_to_s(product)
    qualifications = []
    qualifications << 'organic' if product.organic?
    qualifications << 'non-gmo' if product.non_gmo?
    qualifications << 'no-spray' if product.no_spray?
    qualifications << 'low-spray' if product.low_spray?
    qualifications.split.join(', ')
  end

  def available_pickup_days_select(posting, date)
    posting.available_pickup_days_after_given_date(date).collect { |d| [d, d] }
  end

  def format_date(date)
    Date.parse(date).to_formatted_s(:long_ordinal)
  end

  def format_order_date_long(order)
    "#{order.created_at.to_date.to_formatted_s(:long_ordinal)} (#{order.created_at.to_time.strftime("%-I:%M %p")})"
  end

  def format_order_date_short(order)
    "#{order.created_at.to_date.to_formatted_s} (#{order.created_at.to_time.strftime("%-I:%M %p")})"
  end

end
