CCS12 = Backbone.View.extend({
  events:
    "click .nav a.speakers": "active_speakers_tab",
    "click .nav a.workshops": "active_workshops_tab"

  active_speakers_tab: ->
    $('.schedule .profiles a.talks_tab').click()

  active_workshops_tab: ->
    $('.schedule .profiles a.workshops_tab').click()
})

jQuery ->
  window.view = new CCS12({el: $("body") });