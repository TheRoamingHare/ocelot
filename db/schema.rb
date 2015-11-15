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

ActiveRecord::Schema.define(version: 20151115153758) do

  create_table "activity_logs", force: :cascade do |t|
    t.text     "CurrentActivity"
    t.integer  "CurrentMood"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "User_id"
    t.string   "LogDate"
    t.integer  "LogWindow"
  end

  add_index "activity_logs", ["LogDate"], name: "index_activity_logs_on_LogDate"
  add_index "activity_logs", ["User_id"], name: "index_activity_logs_on_User_id"

  create_table "thought_records", force: :cascade do |t|
    t.text     "CurrentSituation"
    t.text     "Emotions"
    t.text     "AutoThoughts"
    t.text     "AltResponse"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "Outcome"
    t.integer  "activity_log_id"
  end

  add_index "thought_records", ["activity_log_id"], name: "index_thought_records_on_activity_log_id"

  create_table "users", force: :cascade do |t|
    t.string   "Name"
    t.integer  "Zip"
    t.integer  "Age"
    t.string   "email",                  default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "NormalWake"
    t.integer  "NormalSleep"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
