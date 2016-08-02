class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.datetime :started_at
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :status, default: 0

      t.timestamps
    end

    add_foreign_key :games, :teams, column: :home_team_id
    add_foreign_key :games, :teams, column: :away_team_id
  end
end
