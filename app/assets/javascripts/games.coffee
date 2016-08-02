$(document).ready ->
  $(".inning .add").click ->
    id = $(this).closest('.inning').data('inning-id')
    team = $(this).closest('.team').data('team')
    type = $(this).closest('.type').data('type')
    value = $(this).closest('.type').data('value')
    App.games.update inning: id, team: team, type: type, value: value + 1
  $(".inning .subtract").click ->
    id = $(this).closest('.inning').data('inning-id')
    team = $(this).closest('.team').data('team')
    type = $(this).closest('.type').data('type')
    value = $(this).closest('.type').data('value')
    App.games.update inning: id, team: team, type: type, value: value - 1
