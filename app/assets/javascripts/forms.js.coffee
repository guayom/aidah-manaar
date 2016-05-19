$ ->
  $('input').one 'blur keydown', ->
    $(this).addClass('touched')

  $('form').submit ->
    $(this).find('input').addClass('touched')
    $('input:invalid').eq(0).focus()

  $('.selectpicker').selectpicker()

