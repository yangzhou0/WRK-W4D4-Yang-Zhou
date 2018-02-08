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

ActiveRecord::Schema.define(version: 20180208201632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "band_id", null: false
    t.string "title", null: false
    t.integer "year", null: false
    t.boolean "live", default: true, null: false
    t.index ["band_id"], name: "index_albums_on_band_id"
    t.index ["live"], name: "index_albums_on_live"
    t.index ["title"], name: "index_albums_on_title"
    t.index ["year"], name: "index_albums_on_year"
  end

  create_table "bands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["name"], name: "index_bands_on_name"
  end

  create_table "tracks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "album_id", null: false
    t.string "title", null: false
    t.integer "ord", null: false
    t.string "lyrics"
    t.boolean "regular", default: true
    t.index ["lyrics"], name: "index_tracks_on_lyrics"
    t.index ["ord"], name: "index_tracks_on_ord"
    t.index ["regular"], name: "index_tracks_on_regular"
    t.index ["title"], name: "index_tracks_on_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "session_token", null: false
    t.string "password_digest", null: false
    t.string "email"
    t.index ["email"], name: "index_users_on_email"
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

end
