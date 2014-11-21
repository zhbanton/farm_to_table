class PostingSerializer < ActiveModel::Serializer

  attributes :id, :expiration_date, :name, :variety, :image_url, :qualifications

  def expiration_date
    "#{object.expiration_date.to_formatted_s(:long_ordinal)}"
  end

  def name
    "#{object.product.name}"
  end

  def variety
    "#{object.product.variety}"
  end

  def image_url
    "#{object.product.image.url(:thumb)}"
  end

  def qualifications
    qualifications = []
    qualifications << 'organic' if object.product.organic?
    qualifications << 'non-gmo' if object.product.non_gmo?
    qualifications << 'no-spray' if object.product.no_spray?
    qualifications << 'low-spray' if object.product.low_spray?
    "#{qualifications.split.join(', ')}"
  end


end
