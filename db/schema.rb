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

ActiveRecord::Schema.define(version: 20150209105411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.string  "school",  null: false
    t.string  "degree",  null: false
    t.string  "date",    null: false
    t.integer "user_id", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string  "title",        null: false
    t.string  "company_name", null: false
    t.string  "date",         null: false
    t.text    "description",  null: false
    t.integer "user_id",      null: false
  end

  create_table "followings", force: :cascade do |t|
    t.string  "title",   null: false
    t.string  "area",    null: false
    t.integer "user_id", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string  "name",        null: false
    t.string  "proficiency", null: false
    t.integer "user_id",     null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "thumbs_up",  default: 0
    t.integer "message_id",             null: false
    t.integer "user_id",                null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text    "description"
    t.integer "user_id"
    t.integer "network_id",  null: false
  end

  create_table "networks", force: :cascade do |t|
    t.integer "user_id"
    t.string  "connected_ids_array"
  end

  create_table "profile_pages", force: :cascade do |t|
  end

  create_table "projects", force: :cascade do |t|
    t.string  "title",       null: false
    t.text    "description", null: false
    t.integer "user_id",     null: false
  end

  create_table "skills_and_endorsements", force: :cascade do |t|
    t.string  "name_of_skill", null: false
    t.integer "user_id",       null: false
  end

  create_table "summaries", force: :cascade do |t|
    t.text    "description", null: false
    t.integer "user_id",     null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.integer  "network_id"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteerings", force: :cascade do |t|
    t.string  "organization", null: false
    t.string  "role",         null: false
    t.string  "date",         null: false
    t.text    "description"
    t.integer "user_id"
  end

end
