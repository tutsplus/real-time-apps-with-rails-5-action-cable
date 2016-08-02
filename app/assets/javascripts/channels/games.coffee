App.games = App.cable.subscriptions.create "GamesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data["message"]
    # Called when there's incoming data on the websocket for this channel

  update: ->
    @perform 'update'
