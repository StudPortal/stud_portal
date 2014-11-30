$(document).ready ->
  $(".like").click ->
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

  $(".dislike").click ->
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