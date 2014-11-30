$(document).ready ->
  $(".btn-group").on "click", ".like", ->
    _this  = this
    tmpUrl = $(this).parent().parent().parent().find("a.link-to").attr("href")
    console.log tmpUrl
    $.ajax(
      type: "PUT"
      url: tmpUrl + "/up_vote"
    ).done ->
      tmp = $(_this).parent().children(".vote_count").html()
      tmp = +tmp + 1
      $(_this).parent().children(".vote_count").html tmp
      return

    return

  $(".btn-group").on "click", ".dislike", ->
    _this  = this
    tmpUrl = $(this).parent().parent().parent().find("a.link-to").attr("href")
    console.log tmpUrl
    $.ajax(
      type: "PUT"
      url: tmpUrl + "/up_vote"
    ).done ->
      tmp = $(_this).parent().children(".vote_count").html()
      tmp = +tmp - 1
      $(_this).parent().children(".vote_count").html tmp
      return

    return