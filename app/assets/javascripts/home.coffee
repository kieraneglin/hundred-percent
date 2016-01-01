# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.alert-box').slideDown(400).delay(3000).slideUp(400, ->
    $('.index-alert').remove()
    )
