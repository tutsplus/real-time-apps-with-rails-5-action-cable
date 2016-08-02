# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160731151656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "started_at"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "status",       default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "innings", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "number"
    t.integer  "home_team_runs"
    t.integer  "away_team_runs"
    t.integer  "home_team_hits"
    t.integer  "away_team_hits"
    t.integer  "home_team_errors"
    t.integer  "away_team_errors"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["game_id"], name: "index_innings_on_game_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "home_team_id"
end
