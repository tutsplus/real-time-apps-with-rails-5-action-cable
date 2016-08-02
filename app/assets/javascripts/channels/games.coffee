App.games = App.cable.subscriptions.create "GamesChannel",
  connected: ->
    if gameId = $("[data-channel='games']").data('game-id')
      @perform "follow", game_id: gameId
    else
      @perform "unfollow"

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if summary = data['summary']
      $('#home-team-runs').text(summary['home_team']['runs'])
      $('#home-team-hits').text(summary['home_team']['hits'])
      $('#home-team-errors').text(summary['home_team']['errors'])
      $('#away-team-runs').text(summary['away_team']['runs'])
      $('#away-team-hits').text(summary['away_team']['hits'])
      $('#away-team-errors').text(summary['away_team']['errors'])
    if innings = data['innings']
      innings.forEach (inning) =>
        $("#inning-#{inning['number']}-home").text(inning['home']['runs'])
        $("#inning-#{inning['number']}-away").text(inning['away']['runs'])

  update: (data) ->
    @perform 'update', data
