$(document).on "ready", ->
  $('.listing').on('click', '.add-order-item', getPosting)
  $('.listing').on('click', '.update-order-item', updateOrderItem)
  event.preventDefault
