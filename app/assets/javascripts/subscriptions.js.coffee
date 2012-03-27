Subscription = Backbone.View.extend({
  VALUE: {'subscription.first_day': 300, 'subscription.second_day': 300, 'subscription.two_days': 500}

  events:
    "click a.subscription.add": "add"
    "change .subscriptions .subscription .subscription_kind": "update_values"
    "change .subscriptions .subscription .subscription_name": "add_summary"
    "click .summaries .summary .remove a": "remove"

  add: ->
    $('.subscriptions')
    .append(
      $('.subscriptions .subscription:first')
      .clone()
      .removeClass('subscription_1')
      .addClass('subscription_'+($('.subscriptions .subscription').size()+1))
    )
    this.clear_subscription("subscription_"+$('.subscriptions .subscription').size())
    this.delegate_masks()

  update_values: ->
    that = this
    total = 0
    $('.subscriptions .subscription .subscription_kind').each ->
      subscription = that.get_subscription_class($(this))
      $(".summaries .summary."+subscription+" .value span").html(that.VALUE[this.value])
      total = total + that.VALUE[this.value]
    $('form.new_payment .total').val(total)
    $('form.new_payment .subtotal span').html(total)

  add_summary:(that) ->
    that = $(that.target)
    subscription = this.get_subscription_class(that)
    $('.summary.' + subscription).remove();

    this.update_values()
    summary = $('<div>').addClass('summary').addClass(subscription)
    summary.append($('<div>').addClass('name').append(that.val()))
    summary.append($('<div>').addClass('value').append('R$: ').append($('<span>')))
    summary.append($('<div>').addClass('remove').append($('<a href="javascript:void()">').append('Remover')))
    $('.summaries').append(summary)
    this.update_values()

  remove:(that) ->
    that = $(that.target)
    subscription = _.last(that.parents(".summary").attr('class').split(' '))
    that.parents(".summary").remove()
    this.clear_subscription(subscription)
    this.update_values()

  clear_subscription:(id) ->
    $('.subscriptions .subscription.'+id+" input").each ->
      if $(this).attr('type') != "radio"
        $(this).val('')

  delegate_masks:->
    $(".birthday").mask("99/99/9999");
    $(".phone").mask("(99)9999-9999");

  initialize: ->
    $('.subscriptions .subscription:first').addClass('subscription_1')
    this.delegate_masks()

  get_subscription_class: (that)->
    _.last(that.parents(".subscription").attr('class').split(' '))
})

jQuery ->
  window.view = new Subscription({el: $("body") });
