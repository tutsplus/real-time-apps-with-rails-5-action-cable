class CreateInnings < ActiveRecord::Migration[5.0]
  def change
    create_table :innings do |t|
      t.references :game
      t.integer :number
      t.integer :home_team_runs
      t.integer :away_team_runs
      t.integer :home_team_hits
      t.integer :away_team_hits
      t.integer :home_team_errors
      t.integer :away_team_errors

      t.timestamps
    end
  end
end
