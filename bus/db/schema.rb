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

ActiveRecord::Schema.define(version: 20140305014104) do

  create_table "dayofweeks", force: true do |t|
    t.string   "day"
    t.string   "origin"
    t.string   "destiny"
    t.string   "direction"
    t.integer  "line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hours", force: true do |t|
    t.time     "time"
    t.integer  "dayofweek_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lines", force: true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "company"
    t.decimal  "card_price"
    t.decimal  "money_price"
    t.time     "time_to_go"
    t.time     "time_to_back"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.integer  "reference_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "references", force: true do |t|
    t.integer  "line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.integer  "line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
