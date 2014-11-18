@productInfo = (event) ->
  if $(this).parents('.listing').children('.product-info').length == 0
    $.ajax
      url: Routes.posting_path($(this).parents('.listing').data('posting'))
      type: 'GET'
    .done $.proxy((data) ->
      $(this).parents('.listing').append(HandlebarsTemplates.product_info(data))
    , this)
  else
    $(this).parents('.listing').children('.product-info').first().slideToggle('fast')
