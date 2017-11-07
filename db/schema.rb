# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170829060713) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.integer  "accessible_id"
    t.string   "accessible_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "artist_artworks", force: :cascade do |t|
    t.integer  "artist_id",  null: false
    t.integer  "artwork_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artist_artworks", ["artist_id"], name: "index_artist_artworks_on_artist_id"
  add_index "artist_artworks", ["artwork_id"], name: "index_artist_artworks_on_artwork_id"

  create_table "artist_catalogues", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "catalogue_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "artist_catalogues", ["artist_id"], name: "index_artist_catalogues_on_artist_id"
  add_index "artist_catalogues", ["catalogue_id"], name: "index_artist_catalogues_on_catalogue_id"

  create_table "artist_exhibitions", force: :cascade do |t|
    t.integer  "artist_id",     null: false
    t.integer  "exhibition_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "artist_exhibitions", ["artist_id"], name: "index_artist_exhibitions_on_artist_id"
  add_index "artist_exhibitions", ["exhibition_id"], name: "index_artist_exhibitions_on_exhibition_id"

  create_table "artists", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "role"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artwork_catalogues", force: :cascade do |t|
    t.integer  "artwork_id",   null: false
    t.integer  "catalogue_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "artwork_catalogues", ["artwork_id"], name: "index_artwork_catalogues_on_artwork_id"
  add_index "artwork_catalogues", ["catalogue_id"], name: "index_artwork_catalogues_on_catalogue_id"

  create_table "artworks", force: :cascade do |t|
    t.string   "category"
    t.string   "image"
    t.string   "title",        default: "Untitled"
    t.string   "size"
    t.string   "unit"
    t.string   "material"
    t.date     "created_date"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "catalogue_exhibitions", force: :cascade do |t|
    t.integer  "catalogue_id",  null: false
    t.integer  "exhibition_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "catalogue_exhibitions", ["catalogue_id"], name: "index_catalogue_exhibitions_on_catalogue_id"
  add_index "catalogue_exhibitions", ["exhibition_id"], name: "index_catalogue_exhibitions_on_exhibition_id"

  create_table "catalogues", force: :cascade do |t|
    t.integer  "user_id",                          null: false
    t.integer  "space_id"
    t.string   "title",       default: "Untitled"
    t.string   "description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "catalogues", ["space_id"], name: "index_catalogues_on_space_id"
  add_index "catalogues", ["user_id"], name: "index_catalogues_on_user_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "category",         null: false
    t.string   "content"
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "exhibition_spaces", force: :cascade do |t|
    t.integer  "exhibition_id", null: false
    t.integer  "space_id",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "exhibition_spaces", ["exhibition_id"], name: "index_exhibition_spaces_on_exhibition_id"
  add_index "exhibition_spaces", ["space_id"], name: "index_exhibition_spaces_on_space_id"

  create_table "exhibitions", force: :cascade do |t|
    t.string   "category"
    t.string   "title",      null: false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.string   "category",   null: false
    t.string   "title",      null: false
    t.string   "detail"
    t.string   "status"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "artist_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "histories", ["artist_id"], name: "index_histories_on_artist_id"

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "category"
    t.string   "title"
    t.text     "content"
    t.string   "producer"
    t.string   "route"
    t.integer  "page_num"
    t.integer  "catalogue_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pages", ["catalogue_id"], name: "index_pages_on_catalogue_id"

  create_table "players", force: :cascade do |t|
    t.string   "category"
    t.integer  "interval"
    t.integer  "catalogue_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "players", ["catalogue_id"], name: "index_players_on_catalogue_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "location"
    t.string   "map"
    t.string   "service_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
