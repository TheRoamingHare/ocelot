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

ActiveRecord::Schema.define(version: 20151114185513) do

  create_table "activity_logs", force: :cascade do |t|
    t.text     "CurrentActivity"
    t.integer  "CurrentMood"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "thought_records", force: :cascade do |t|
    t.text     "CurrentSituation"
    t.text     "Emotions"
    t.integer  "FirstEmotionStrength"
    t.text     "AutoThoughts"
    t.text     "AltResponse"
    t.integer  "SecondEmotionStrength"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "Name"
    t.integer  "Zip"
    t.integer  "Age"
    t.string   "Email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
