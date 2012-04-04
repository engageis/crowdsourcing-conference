Schedules = Backbone.View.extend({
  events:
    "click .schedule .days a.first_tab": "first_tab",
    "click .schedule .days a.second_tab": "second_tab"

  first_tab: ->
    $('.schedule .days #first_day').fadeIn('slow');
    $('.schedule .days #second_day').hide()
    $('.schedule .days a.first_tab').addClass('selected')
    $('.schedule .days a.second_tab').removeClass('selected')

  second_tab: ->
    $('.schedule .days #second_day').fadeIn('slow');
    $('.schedule .days #first_day').hide()
    $('.schedule .days a.second_tab').addClass('selected')
    $('.schedule .days a.first_tab').removeClass('selected')

})

jQuery ->
  window.view = new Schedules({el: $("body") });