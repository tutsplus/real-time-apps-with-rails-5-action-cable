App.summary = App.cable.subscriptions.create "SummaryChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    game = data['game']
    $(".game-#{game['id']}.home .runs").text(game['home']['runs'])
    $(".game-#{game['id']}.home .hits").text(game['home']['hits'])
    $(".game-#{game['id']}.home .errors").text(game['home']['errors'])
    $(".game-#{game['id']}.away .runs").text(game['away']['runs'])
    $(".game-#{game['id']}.away .hits").text(game['away']['hits'])
    $(".game-#{game['id']}.away .errors").text(game['away']['errors'])
