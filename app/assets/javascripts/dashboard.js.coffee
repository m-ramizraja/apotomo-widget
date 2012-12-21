# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".dragable-list li").draggable({
    revert: "invalid"
  })

  $(".loveable img").click ->
    $.ajax({url: $(this).parent().parent().attr("data-event-url") + "&id=" +
    $(this).parent().parent().attr("data-id")})