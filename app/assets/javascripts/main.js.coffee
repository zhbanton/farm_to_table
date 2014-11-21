ready = ->
  $('.listing').on('click', '.add-order-item', getPosting)
  $('.listing').on('click', '.update-order-item', updateOrderItem)
  $('.listing').on('click', '.remove-order-item', removeOrderItem)
  $('.listing').on('click', '.remove-order-item-order-page', removeOrderItem)
  $('.product-name').click(getProductInfo)
  $('.farm-name').click(getFarmInfo)
  event.preventDefault

$(document).ready(ready)
$(document).on("page:load", ready)
