# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready () ->
  $(".show_all").on 'click', (e) ->
    show_all e.target.id
    $(e.target).removeClass 'show'
    $(e.target).addClass 'hide'
    $(e.target).parent().children('.hide_all').removeClass 'hide'
    $(e.target).parent().children('.hide_all').addClass 'show'

  $(".hide_all").on 'click', (e) ->
    hide_all e.target.id
    $(e.target).removeClass 'show'
    $(e.target).addClass 'hide'
    $(e.target).parent().children('.show_all').removeClass 'hide'
    $(e.target).parent().children('.show_all').addClass 'show'

  $(".title-event.clickable").on 'click', (e) ->
    $(e.target).removeClass 'sshow'
    $(e.target).addClass 'hide'
    id = e.target.id
    $(e.target).parent().children(".form-event##{id}").removeClass 'hide'
    $(e.target).parent().children(".form-event##{id}").addClass 'sshow'
    $(e.target).parent().children(".form-event##{id}").find("#event_title").focus()
    old_val = $(e.target).parent().children(".form-event##{id}").find("#event_title").val()
    $(e.target).parent().children(".form-event##{id}").find("#event_title").on 'blur', () ->
      if old_val != $(e.target).parent().children(".form-event##{id}").find("#event_title").val() && confirm('Сохранить?')
        $(e.target).parent().find(".form-event##{id} form").submit()
      else
        $(e.target).removeClass 'hide'
        $(e.target).addClass 'sshow'
        $(e.target).parent().children(".form-event##{id}").removeClass 'sshow'
        $(e.target).parent().children(".form-event##{id}").addClass 'hide'

  show_all = (id) ->
    $(".table-calendar td##{id} .table-event tr .toggleable").each (e, elem) ->
      $(elem).removeClass 'hide'
      $(elem).addClass 'show'

  hide_all = (id) ->
    $(".table-calendar td##{id} .table-event tr .toggleable").each (e, elem) ->
      $(elem).removeClass 'show'
      $(elem).addClass 'hide'