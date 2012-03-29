Schedules = Backbone.View.extend({
  events:
    "click .schedule .days a.first_tab": "first_tab"
    "click .schedule .days a.second_tab": "second_tab"

  first_tab: ->
    $('.schedule .days #first_day').fadeIn('slow');
    $('.schedule .days #second_day').hide()

  second_tab: ->
    $('.schedule .days #second_day').fadeIn('slow');
    $('.schedule .days #first_day').hide()

})

jQuery ->
  window.view = new Schedules({el: $("body") });