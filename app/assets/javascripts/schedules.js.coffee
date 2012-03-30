Schedules = Backbone.View.extend({
  events:
    "click .schedule .days a.first_tab": "first_tab"
    "click .schedule .days a.second_tab": "second_tab"

  first_tab: ->
    $('.schedule .days #first_day').fadeIn('slow');
    $('.schedule .days #second_day').hide()
    this.toggle()

  second_tab: ->
    $('.schedule .days #second_day').fadeIn('slow');
    $('.schedule .days #first_day').hide()
    this.toggle()

  toggle: ->
    $('.schedule .days a.first_tab').toggleClass('selected')
    $('.schedule .days a.second_tab').toggleClass('selected')
})

jQuery ->
  window.view = new Schedules({el: $("body") });