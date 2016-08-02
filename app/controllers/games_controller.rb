class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit]

  def index
    @games = Game.all.includes(:home_team, :away_team).order(:started_at)
    @teams = Team.all.sort_by { |team| -team.percentage }
  end

  def show
  end

  def edit
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end
end
