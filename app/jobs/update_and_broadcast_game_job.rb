class UpdateAndBroadcastGameJob < ApplicationJob
  queue_as :default

  def perform(data)
    inning = Inning.find(data['inning'])
    field = "#{data['team']}_team_#{data['type']}"
    inning.update(field => data['value'] > 0 ? data['value'] : 0)
    ActionCable.server.broadcast("games:#{inning.game.id}", {
      summary: {
        home_team: {
          runs: inning.game.home_team_runs,
          hits: inning.game.home_team_hits,
          errors: inning.game.home_team_errors,
        },
        away_team: {
          runs: inning.game.away_team_runs,
          hits: inning.game.away_team_hits,
          errors: inning.game.away_team_errors,
        }
      },
      innings: [{
        number: inning.number,
        home: {
          runs: inning.home_team_runs,
          hits: inning.home_team_hits,
          errors: inning.home_team_errors,
        },
        away: {
          runs: inning.away_team_runs,
          hits: inning.away_team_hits,
          errors: inning.away_team_errors,
        }
      }]
    })
    ActionCable.server.broadcast "summary", game: {
      id: inning.game.id,
      home: {
        runs: inning.game.home_team_runs,
        hits: inning.game.home_team_hits,
        errors: inning.game.home_team_errors,
      },
      away: {
        runs: inning.game.away_team_runs,
        hits: inning.game.away_team_hits,
        errors: inning.game.away_team_errors,
      }
    }
  end
end
