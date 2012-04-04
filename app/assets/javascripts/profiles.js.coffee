Profiles = Backbone.View.extend({
  events:
    "click .schedule .profiles a.talks_tab": "speakers_tab",
    "click .schedule .profiles a.workshops_tab": "workshops_tab"

  speakers_tab: ->
    $('.schedule .profiles #speakers').fadeIn('slow');
    $('.schedule .profiles #workshops').hide()
    $('.schedule .profiles a.talks_tab').addClass('selected')
    $('.schedule .profiles a.workshops_tab').removeClass('selected')

  workshops_tab: ->
    $('.schedule .profiles #workshops').fadeIn('slow');
    $('.schedule .profiles #speakers').hide()
    $('.schedule .profiles a.workshops_tab').addClass('selected')
    $('.schedule .profiles a.talks_tab').removeClass('selected')

})

jQuery ->
  window.view = new Profiles({el: $("body") });