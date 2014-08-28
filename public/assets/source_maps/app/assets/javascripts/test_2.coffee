@getPosting = (event) ->
  $(this).prop('disabled', true)
  $.ajax
    url: Routes.posting_path($(this).parents('.listing').data('posting')),
    type: 'GET'
  .done $.proxy(addOrderItem, this)
  event.preventDefault

@addOrderItem = (data) ->
  _postingId = data.id
  _quantity = $(this).parents('.listing').find('#order_item_quantity').val()
  _pickupDate = $(this).parents('.listing').find('#order_item_pickup_date').val()
  _data = order_item: { posting_id: _postingId, quantity: _quantity, pickup_date: _pickupDate }
  $.ajax
    url: Routes.order_items_path(),
    type: 'POST',
    data: _data,
    dataType: 'json'
  .done $.proxy(addEditAndRemove, $(this).parents('.action-buttons').first())
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

@updateOrderItem = (event) ->
  $(this).prop('disabled', true)
  _quantity = $(this).parents('.listing').find('#order_item_quantity').val()
  _pickupDate = $(this).parents('.listing').find('#order_item_pickup_date').val()
  _data = order_item: { quantity: _quantity, pickup_date: _pickupDate }
  $.ajax
    url: Routes.order_item_path($(this).parents('.listing').data('order-item')),
    type: 'PATCH',
    data: _data,
    dataType: 'json'
  .done $.proxy( ->
    updateSuccess $(this)
  , this)
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

@removeOrderItem = (event) ->
  $(this).prop('disabled', true)
  $.ajax
    url: Routes.order_item_path($(this).parents('.listing').data('order-item')),
    type: 'DELETE'
  .done $.proxy($(this) ->
    if this.hasClass('remove-order-item')
      addAddButton $.proxy addAddButton(data), s$(this).parents('.action-buttons').first())
  .fail $.proxy((jqXHR) ->
    genericFailure jqXHR
  , this)
  .always $.proxy( ->
    $(this).prop('disabled', false);
  , this)
  event.preventDefault

@addEditAndRemove = (data) ->
  $(this).parents('.listing').data('order-item', data.id)
  $(this).children().remove()
  $(this).append $('<button>').text('Update').addClass('update-order-item btn btn-primary')
  $(this).append $('<button>').text('Remove').addClass('remove-order-item btn btn-danger')

@addAddButton = (data) ->
  $(this).parents('.listing').removeData('order-item')
  $(this).parents('.listing').find('#order_item_quantity').val('')
  $(this).parents('.listing').find('#order_item_pickup_date').val('')
  $(this).children().remove()
  $(this).append $('<button>').text('Add').addClass('add-order-item btn btn-success')

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
    placement: "top"

  $form.tooltip "show"
  setTimeout (->
    $form.tooltip "destroy"
    return
  ), 2000

@updateSuccess = ($form) ->
  $form.tooltip "destroy"
  $form.tooltip
    title: "order updated"
    trigger: "manual"
    placement: "top"

  $form.tooltip "show"
  setTimeout (->
    $form.tooltip "destroy"
    return
  ), 2000

@genericFailure = (jqXHR) ->
  alert "Error " + jqXHR.status + " occurred. Try refreshing maybe?"

