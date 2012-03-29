Subscriptions = Backbone.View.extend({
  VALUES: {'subscription.first_day': 300, 'subscription.second_day': 300, 'subscription.two_days': 500}

  events:
    "click a.subscription.add": "add"
    "change .subscriptions .subscription .subscription_kind": "update_values"
    "change .subscriptions .subscription .subscription_name": "add_summary"
    "click .summaries .summary .remove a": "remove"

  add: ->
    size = $('.subscriptions .subscription').size()
    subscription_class = 'subscription_'+(size+1)
    $('.subscriptions')
    .append(
      $('.subscriptions .subscription:first')
      .clone()
      .removeClass('subscription_1')
      .addClass(subscription_class)
    )
    this.clear_subscription(subscription_class)
    this.delegate_masks()

    this.change_inputs_name('.subscriptions .subscription.' + subscription_class)
    this.html_summary(subscription_class, null)

  change_inputs_name:(selector) ->
    size = $('.subscriptions .subscription').size()
    $(selector + ' input, ' + selector + ' select').each ->
      $(this).attr('name', $(this).attr('name').replace("payment[subscriptions_attributes][0]", "payment[subscriptions_attributes]["+(size-1)+"]"))

  update_values: ->
    that = this
    total = 0
    $('.subscriptions .subscription .subscription_kind').each ->
      subscription = that.get_subscription_class($(this))
      $(".summaries .summary."+subscription+" .value span").html(that.VALUES[this.value])
      total = total + that.VALUES[this.value]
    $('form.new_payment .total').val(total)
    $('form.new_payment .subtotal span').html(total)

  add_summary:(that) ->
    that = $(that.target)
    subscription = this.get_subscription_class(that)
    $('.summary.' + subscription).remove();
    this.html_summary(subscription, that.val())
    this.update_values()

  html_summary:(subscription, name) ->
    $('.summaries').append(
      $('<div>').addClass('summary').addClass(subscription)
      .append(
        $('<div>').addClass('name').append(name)
      )
      .append(
        $('<div>').addClass('value').append('R$: ').append($('<span>'))
      )
      .append(
        $('<div>').addClass('remove').append($('<a href="javascript:void()">').append(I18n.remove))
      )
    )

  remove:(that) ->
    that = $(that.target)
    subscription = _.last(that.parents(".summary").attr('class').split(' '))
    that.parents(".summary").remove()
    this.clear_subscription(subscription)
    if subscription != "subscription_1"
      $(".subscriptions .subscription."+subscription).remove()
    this.update_values()

  clear_subscription:(id) ->
    $('.subscriptions .subscription.'+id+" input").each ->
      if $(this).attr('type') != "radio"
        $(this).val('')

  delegate_masks:->
    $(".birthday").mask("99/99/9999");
    $(".phone").mask("(99)9999-9999");

  initialize: ->
    i = 0
    $('.subscriptions .subscription').each ->
      i += 1
      $(this).addClass('subscription_'+i)
    this.delegate_masks()

  get_subscription_class: (that)->
    _.last(that.parents(".subscription").attr('class').split(' '))
})

jQuery ->
  window.view = new Subscriptions({el: $("body") });
