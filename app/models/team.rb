class Team < ApplicationRecord
  has_many :home_games, class_name: "Game", foreign_key: :home_team_id
  has_many :away_games, class_name: "Game", foreign_key: :away_team_id

  def wins
    played_games.select { |g| g.is_winner? self }.count
  end

  def losses
    played_games.reject { |g| g.is_winner? self }.count
  end

  def percentage
    wins + losses > 0 ? (1.0 * wins / (wins + losses)) : 0
  end

  def games_behind(other)
    ((other.wins - self.wins) + (self.losses - other.losses)) / 2.0
  end

  def home_runs
    home_games.to_a.sum(&:home_team_runs)
  end

  def away_runs
    away_games.to_a.sum(&:away_team_runs)
  end

  def points_for
    home_games.to_a.sum(&:home_team_runs) + away_games.to_a.sum(&:away_team_runs)
  end

  def points_against
    home_games.to_a.sum(&:away_team_runs) + away_games.to_a.sum(&:home_team_runs)
  end

  def difference
    points_for - points_against
  end

  def games
    Game.where(home_team: self).or(Game.where(away_team: self))
  end

  def played_games
    games.where(status: :final)
  end
end
