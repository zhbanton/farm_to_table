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
  _cost = _quantity * data.price_per_unit
  _data = order_item: {posting_id: _postingId, quantity: _quantity, pickup_date: _pickupDate, cost: _cost }
  debugger
  $.ajax
    url: Routes.order_items_path(),
    type: 'POST',
    data: _data,
    dataType: 'json'
  .done logData
  event.preventDefault

@logData = (data) ->
  console.log(data)
