Subscriptions = Backbone.View.extend({

  initialize: ->
    $('.editions #videos ul').bind('ajax:success', this.success);
    $('.editions #videos ul').bind('ajax:complete', this.complete);
    $('.editions #videos ul').bind('ajax:before', this.before);
    this.video_visualization = $('.editions #videos .video_visualization')

  success: (obj, response)->
    $('.editions #videos .video_visualization').html(response)

  complete: (obj)->
    $('.editions #videos .video_visualization').fadeTo(300, 1)
    $(obj.target).parents("li").fadeTo(300, 1)

  before: (obj)->
    $('.editions #videos .video_visualization').fadeTo(300, 0.25)
    $(obj.target).parents("li").fadeTo(300, 0.25)
})

jQuery ->
  window.view = new Subscriptions({el: $("body") });
