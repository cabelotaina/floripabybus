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

ActiveRecord::Schema.define(version: 20140220021302) do

  create_table "busdayofweeks", force: true do |t|
    t.string   "day"
    t.string   "direction"
    t.integer  "busline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buslines", force: true do |t|
    t.string   "number"
    t.string   "line"
    t.string   "company"
    t.decimal  "card_price"
    t.decimal  "money_price"
    t.time     "time_to_go"
    t.time     "time_to_back"
    t.integer  "busdayofweek_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buslines", ["busdayofweek_id"], name: "index_buslines_on_busdayofweek_id"

  create_table "bustimes", force: true do |t|
    t.time     "time"
    t.string   "label"
    t.integer  "busdayofweek_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
