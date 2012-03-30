Profiles = Backbone.View.extend({
  events:
    "click .schedule .profiles a.talks_tab": "speakers_tab"
    "click .schedule .profiles a.workshops_tab": "workshops_tab"

  speakers_tab: ->
    $('.schedule .profiles #speakers').fadeIn('slow');
    $('.schedule .profiles #workshops').hide()
    this.toggle()

  workshops_tab: ->
    $('.schedule .profiles #workshops').fadeIn('slow');
    $('.schedule .profiles #speakers').hide()
    this.toggle()

  toggle: ->
    $('.schedule .profiles a.talks_tab').toggleClass('selected')
    $('.schedule .profiles a.workshops_tab').toggleClass('selected')

})

jQuery ->
  window.view = new Profiles({el: $("body") });