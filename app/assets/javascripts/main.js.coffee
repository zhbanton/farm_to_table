ready = ->
  $('.listing').on('click', '.add-order-item', getPosting)
  $('.listing').on('click', '.update-order-item', updateOrderItem)
  $('.listing').on('click', '.remove-order-item', removeOrderItem)
  $('.listing').on('click', '.remove-order-item-order-page', removeOrderItem)
  $('.listing').on('click', '.product-name', productInfo)
  event.preventDefault

$(document).ready(ready)
$(document).on("page:load", ready)
