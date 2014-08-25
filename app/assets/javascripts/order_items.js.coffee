@getPosting = (event) ->
  $.ajax
    url: Routes.posting_path($(this).parents('.listing').data('posting')),
    type: 'GET'
  .done $.proxy(addToOrder, this)
  event.preventDefault

@addToOrder = (data) ->
  _postingId = data.id
  _quantity = $(this).parents('.listing').find('.quantity').val()
  _pickupDate = $(this).parents('.listing').find('#pickup_day').val()
  _price_per_unit = data.price_per_unit
  _unit = data.unit
  _data = order_item: {posting_id: _postingId, quantity: _quantity, pickup_date: _pickupDate, price_per_unit: _price_per_unit, unit: _unit }
  $.ajax
    url: Routes.order_items_path(),
    type: 'POST',
    data: _data,
    dataType: 'json'
  .done logData
  event.preventDefault

@logData = (data) ->
  console.log(data)
