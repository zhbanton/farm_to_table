@getPosting = (event) ->
  $(this).prop('disabled', true)
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
  .fail $.proxy((jqXHR) ->
    if jqXHR.status is 422
      validationFailure jqXHR.responseJSON.errors, $(this)
    else
      genericFailure jqXHR
  , this)
  .always $.proxy( ->
    $(this).prop('disabled', false);
  , this)
  event.preventDefault

@addEditAndDelete = (data) ->
  $(this).children().remove()
  $(this).append $('<button>').text('Update').addClass('update-order btn btn-primary')
  $(this).append $('<button>').text('Delete').addClass('delete-from-order btn btn-danger')
  event.preventDefault

@validationFailure = (errors, $form) ->
  errorString = $.map(errors, (messages, attribute) ->
    messages.map((message) ->
      attribute + " " + message
    ).join ", "
  ).join(", ")
  $form.tooltip "destroy"
  $form.tooltip
    title: errorString
    trigger: "manual"
    placement: "right"

  $form.tooltip "show"
  setTimeout (->
    $form.tooltip "destroy"
    return
  ), 2000
  return

  genericFailure = (jqXHR) ->
    alert "Error " + jqXHR.status + " occurred. Try refreshing maybe?"

