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

ActiveRecord::Schema.define(version: 20170607132727) do

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
    t.string   "academic"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.string   "category"
    t.string   "artist_name"
    t.string   "photo"
    t.string   "title"
    t.string   "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "material"
    t.date     "created_date"
    t.integer  "artist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "artworks", ["artist_id"], name: "index_artworks_on_artist_id"

  create_table "catalogue_exhibitions", force: :cascade do |t|
    t.integer  "catalogue_id",  null: false
    t.integer  "exhibition_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "catalogue_exhibitions", ["catalogue_id"], name: "index_catalogue_exhibitions_on_catalogue_id"
  add_index "catalogue_exhibitions", ["exhibition_id"], name: "index_catalogue_exhibitions_on_exhibition_id"

  create_table "catalogues", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "artist_id"
    t.integer  "space_id"
    t.string   "title",       null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "catalogues", ["artist_id"], name: "index_catalogues_on_artist_id"
  add_index "catalogues", ["space_id"], name: "index_catalogues_on_space_id"
  add_index "catalogues", ["user_id"], name: "index_catalogues_on_user_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "category",         default: "---\n- facebook\n- twitter\n", null: false
    t.string   "content",                                                   null: false
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string   "category"
    t.string   "title",      null: false
    t.date     "start_date", null: false
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.string   "category",                          null: false
    t.string   "title",                             null: false
    t.string   "content"
    t.string   "start_date"
    t.string   "end_date",   default: "start_date"
    t.integer  "artist_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "histories", ["artist_id"], name: "index_histories_on_artist_id"

  create_table "pages", force: :cascade do |t|
    t.string   "category"
    t.string   "content"
    t.string   "route"
    t.string   "title"
    t.integer  "pageNum"
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
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "name",         default: "none", null: false
    t.string   "location"
    t.string   "map"
    t.string   "service_time"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
