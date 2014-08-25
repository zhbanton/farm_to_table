@getPosting = (event) ->
  $.ajax
    url: Routes.posting_path($(this).parents('.listing').data('posting')),
    type: 'GET'
  .done $.proxy(addToOrder, this)
  event.preventDefault

@addToOrder = (data) ->
  _postingId = data.id
  _quantity = $(this).parents('.listing').find('#order_item_quantity').val()
  _pickupDate = $(this).parents('.listing').find('#order_item_pickup_date').val()
  _price_per_unit = data.price_per_unit
  _unit = data.unit
  _data = order_item: {posting_id: _postingId, quantity: _quantity, pickup_date: _pickupDate, price_per_unit: _price_per_unit, unit: _unit }
  $.ajax
    url: Routes.order_items_path(),
    type: 'POST',
    data: _data,
    dataType: 'json'
  .done $.proxy(addEditAndDelete, $(this).parent())
  event.preventDefault

@addEditAndDelete = (data) ->
  $(this).children().remove()
  $(this).append $('<button>').text('Update').addClass('update-order btn btn-primary')
  $(this).append $('<button>').text('Delete').addClass('delete-from-order btn btn-danger')
  event.preventDefault

