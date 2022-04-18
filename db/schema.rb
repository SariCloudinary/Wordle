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

ActiveRecord::Schema[7.0].define(version: 2022_04_16_174738) do
  create_table "game_sessions", force: :cascade do |t|
    t.string "word"
    t.integer "score"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_game_sessions_on_user_id"
  end

  create_table "guesses", force: :cascade do |t|
    t.string "guessed_word"
    t.integer "game_session_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_guesses_on_game_session_id"
    t.index ["user_id"], name: "index_guesses_on_user_id"
  end

  create_table "user_words", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "word_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_words_on_user_id"
    t.index ["word_id"], name: "index_user_words_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "score", default: 0
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "name", limit: 5
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "game_sessions", "users"
  add_foreign_key "guesses", "game_sessions"
  add_foreign_key "guesses", "users"
  add_foreign_key "user_words", "users"
  add_foreign_key "user_words", "words"
end
