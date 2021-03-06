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

ActiveRecord::Schema.define(version: 20161119205827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.date     "date"
    t.integer  "buy_in"
    t.time     "time_played"
    t.integer  "season_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "completed",   default: false
    t.index ["season_id"], name: "index_games_on_season_id", using: :btree
  end

  create_table "nemeses", force: :cascade do |t|
    t.integer  "nemesis_id"
    t.integer  "stalker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nemesis_id", "stalker_id"], name: "index_nemeses_on_nemesis_id_and_stalker_id", unique: true, using: :btree
    t.index ["nemesis_id"], name: "index_nemeses_on_nemesis_id", using: :btree
    t.index ["stalker_id"], name: "index_nemeses_on_stalker_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "game_id"
    t.integer  "finishing_place"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "additional_expense", default: 0
    t.float    "score"
    t.index ["game_id"], name: "index_players_on_game_id", using: :btree
    t.index ["participant_id"], name: "index_players_on_participant_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "games", "seasons"
  add_foreign_key "players", "games"
  add_foreign_key "players", "participants"
end
