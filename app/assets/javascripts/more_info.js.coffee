@getProductInfo = (event) ->
  if $(this).parents('.listing').children('.product-info').length == 0
    $.ajax
      url: Routes.posting_path($(this).parents('.listing').data('posting'))
      type: 'GET'
    .done $.proxy((data) ->
      $(this).parents('.listing').append(HandlebarsTemplates.product_info(data))
    , this)
  else
    $(this).parents('.listing').children('.product-info').first().slideToggle('fast')

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
