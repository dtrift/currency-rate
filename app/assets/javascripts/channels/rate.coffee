App.rate = App.cable.subscriptions.create "RateChannel",
  connected: ->
    console.log 'Connected successful'
    @perform 'change'

  received: (data) ->
    $('.current_rate').text data["current_rate"] + '₽'
