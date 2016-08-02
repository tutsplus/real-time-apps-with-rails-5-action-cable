class Game < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  has_many :innings, -> { order(number: :asc) }

  enum status: [:scheduled, :running, :final]

  def is_winner?(team)
    if home_team == team
      home_team_runs > away_team_runs
    else
      away_team_runs > home_team_runs
    end
  end

  def home_team_runs
    innings.sum(:home_team_runs)
  end

  def away_team_runs
    innings.sum(:away_team_runs)
  end

  def home_team_hits
    innings.sum(:home_team_hits)
  end

  def away_team_hits
    innings.sum(:away_team_hits)
  end

  def home_team_errors
    innings.sum(:home_team_errors)
  end

  def away_team_errors
    innings.sum(:away_team_errors)
  end
end
