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

ActiveRecord::Schema.define(version: 20170209111554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "share_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["share_id"], name: "index_bookings_on_share_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "photo"
    t.integer  "user_id"
    t.integer  "place_id"
    t.index ["place_id"], name: "index_items_on_place_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "postcode"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_places_on_user_id", using: :btree
  end

  create_table "shares", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.float    "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "spent"
    t.integer  "rating"
    t.index ["item_id"], name: "index_shares_on_item_id", using: :btree
    t.index ["user_id"], name: "index_shares_on_user_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "bookings", "shares"
  add_foreign_key "items", "places"
  add_foreign_key "items", "users"
  add_foreign_key "places", "users"
  add_foreign_key "shares", "items"
  add_foreign_key "shares", "users"
end
