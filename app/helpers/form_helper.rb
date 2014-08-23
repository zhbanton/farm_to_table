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

  def set_posting_default_price_and_unit(posting)
    posting.unit = posting.product.default_unit.present? ? posting.product.default_unit : last_associated_posting_unit(posting)
    posting.price_per_unit = posting.product.default_price.present? ? posting.product.default_price : last_associated_posting_price(posting)
    posting
  end

  private

  def last_associated_posting_unit(posting)
    posting.product.postings.length > 1 ? last_associated_posting(posting).unit : ''
  end

  def last_associated_posting_price(posting)
    posting.product.postings.length > 1 ? last_associated_posting(posting).price_per_unit : ''
  end

  def last_associated_posting(posting)
    posting.product.postings.order(:created_at).last
  end

end
