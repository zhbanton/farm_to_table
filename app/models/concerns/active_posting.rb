module ActivePosting

  def active_postings
    active_postings = postings.includes(:product).where('postings.expiration_date >= ?', Date.tomorrow)
  end

  def active_postings_by_date
    active_postings.order(:starting_date, :expiration_date).find_all do |posting|
      posting.available_pickup_days_after_given_date(Date.tomorrow).present?
    end
  end

  def active_postings_by_name
    active_postings.order('products.name', :starting_date).find_all do |posting|
      posting.available_pickup_days_after_given_date(Date.tomorrow).present?
    end
  end

  def inactive_postings
    inactive_postings = postings.where('expiration_date < ?', Date.tomorrow).order(expiration_date: :desc)
    inactive_postings + active_postings.find_all { |posting| posting.available_pickup_days_after_given_date(Date.tomorrow).empty? }
  end

end
