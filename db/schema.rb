# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_30_132313) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "status", ["Waiting_for_players", "Started", "Ended"]
  create_enum "suit", ["Hearts", "Diamonds", "Clubs", "Spades"]

  create_table "cards", force: :cascade do |t|
    t.bigint "pile_id", null: false
    t.integer "position", null: false
    t.enum "suit", null: false, enum_type: "suit"
    t.integer "weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pile_id"], name: "index_cards_on_pile_id"
    t.index ["position", "pile_id"], name: "index_cards_on_position_and_pile_id", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.integer "playercount", null: false
    t.string "name", null: false
    t.enum "status", default: "Waiting_for_players", null: false, enum_type: "status"
    t.bigint "play_pile_id", null: false
    t.bigint "stock_pile_id", null: false
    t.boolean "online", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_pile_id"], name: "index_games_on_play_pile_id", unique: true
    t.index ["stock_pile_id"], name: "index_games_on_stock_pile_id", unique: true
  end

  create_table "piles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "cards", "piles"
  add_foreign_key "games", "piles", column: "play_pile_id"
  add_foreign_key "games", "piles", column: "stock_pile_id"
end
