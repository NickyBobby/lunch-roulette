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

ActiveRecord::Schema.define(version: 20160423010452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lunch_roulette_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slack_users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "slack_id"
    t.string   "image"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_group_id"
  end

  add_index "slack_users", ["user_group_id"], name: "index_slack_users_on_user_group_id", using: :btree

  create_table "user_groups", force: :cascade do |t|
    t.string   "team_id"
    t.string   "name"
    t.integer  "user_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_group"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "favorite_food"
    t.string   "image_url"
    t.datetime "admin_at"
    t.string   "uid"
    t.string   "username"
    t.string   "token"
    t.datetime "vegetarian_at"
    t.datetime "vegan_at"
    t.datetime "gluten_free_at"
  end

  add_foreign_key "slack_users", "user_groups"
end
