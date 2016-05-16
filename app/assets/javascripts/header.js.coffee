$ ->
  $('.navbar').affix
    offset:
      top: ->
        $('.header').outerHeight(true)
