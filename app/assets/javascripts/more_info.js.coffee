@getProductInfo = (event) ->
  unless $(this).parents('.listing').next().hasClass('product-info')
    $.ajax
      url: Routes.posting_path($(this).parents('.listing').data('posting'))
      type: 'GET'
    .done $.proxy((data) ->
      $(this).parents('.listing').after(HandlebarsTemplates.product_info(data))
    , this)
  else
    $(this).parents('.listing').next().slideToggle('fast')
  event.preventDefault()

@getFarmInfo = (event) ->
  if $(this).parents('.farm').children('.farm-info').length == 0
    $.ajax
      url: Routes.farm_path($(this).parents('.farm').data('farm'))
      type: 'GET'
    .done $.proxy((data) ->
      $(this).parents('.farm').append(HandlebarsTemplates.farm_info(data))
    , this)
  else
    $(this).parents('.farm').children('.farm-info').first().slideToggle('fast')
  event.preventDefault()
