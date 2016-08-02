# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teams = Team.create([
  { name: "Spinning Sharks" },
  { name: "Butterfly Spanners" },
  { name: "Dream Slayers" },
  { name: "Eccentric Robots" },
  { name: "Toxic Chuckers" }
])

next_date = Time.zone.now.at_noon + 6.hours

teams.each do |team|
  other_teams = teams - [team]

  other_teams.each do |other_team|
    game = Game.create(home_team: team, away_team: other_team, started_at: next_date)
    9.times { |number| game.innings.create(number: number + 1) }
    next_date += 1.day
  end
end
