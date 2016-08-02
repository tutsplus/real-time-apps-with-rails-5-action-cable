$(document).ready ->
  $(".inning .add").click ->
    id = $(this).closest('.inning').data('inning-id')
    team = $(this).closest('.team').data('team')
    type = $(this).closest('.type').data('type')
    value = $(this).closest('.type')
    new_value = value.data('value') + 1
    value.data('value', new_value)
    value.find('.value').text(new_value)
    App.games.update inning: id, team: team, type: type, value: new_value
  $(".inning .subtract").click ->
    id = $(this).closest('.inning').data('inning-id')
    team = $(this).closest('.team').data('team')
    type = $(this).closest('.type').data('type')
    value = $(this).closest('.type')
    new_value = if value.data('value') > 0 then value.data('value') - 1 else 0
    value.data('value', new_value)
    value.find('.value').text(new_value)
    App.games.update inning: id, team: team, type: type, value: new_value
