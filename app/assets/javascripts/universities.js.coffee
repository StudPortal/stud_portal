# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $(".like").click ->
    $.ajax(
      type: "PUT"
      url: "http://0.0.0.0:3000/universities/547a71a4626d611869000000/down_vote"
    ).done ->
      tmp = $(this).parent().children('.active').html() + 1
      console.log tmp
      $(this).parent().children('.active').html tmp
      return

    return

  return


