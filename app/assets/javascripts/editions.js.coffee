Editions = Backbone.View.extend({
  events:
    "click .editions .tabs a.videos": "videos",
    "click .editions .tabs a.photos": "photos",
    "click .editions .tabs a.presentations": "presentations"

  videos: ->
    $('.editions #videos').fadeIn('slow');
    $('.editions #photos, .editions #presentations').hide()
    $('.editions .tabs a.videos').addClass('selected')
    $('.editions .tabs a.photos, .editions .tabs a.presentations').removeClass('selected')

  photos: ->
    $('.editions #photos').fadeIn('slow');
    $('.editions #videos, .editions #presentations').hide()
    $('.editions .tabs a.photos').addClass('selected')
    $('.editions .tabs a.videos, .editions .tabs a.presentations').removeClass('selected')

  presentations: ->
    $('.editions #presentations').fadeIn('slow');
    $('.editions #videos, .editions #photos').hide()
    $('.editions .tabs a.presentations').addClass('selected')
    $('.editions .tabs a.videos, .editions .tabs a.photos').removeClass('selected')

})

jQuery ->
  window.view = new Editions({el: $("body") });