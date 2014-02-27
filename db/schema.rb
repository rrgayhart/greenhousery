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

ActiveRecord::Schema.define(version: 20140227013442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keys", force: true do |t|
    t.string "service"
    t.string "key"
    t.string "etc"
  end

  create_table "points", force: true do |t|
    t.integer "project_array_id"
    t.decimal "x_coordinate"
    t.decimal "y_coordinate"
    t.decimal "z_coordinate"
    t.decimal "length"
  end

  add_index "points", ["project_array_id"], name: "index_points_on_project_array_id", using: :btree

  create_table "project_arrays", force: true do |t|
    t.string  "name"
    t.integer "project_id"
    t.decimal "sqft"
  end

  add_index "project_arrays", ["project_id"], name: "index_project_arrays_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string  "name"
    t.integer "user_id"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "sqft"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "country"
    t.string  "station_city"
    t.string  "station_state"
    t.integer "distance_from_station"
    t.integer "station_elevation"
    t.integer "station_timezone"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "solar_modules", force: true do |t|
    t.string  "brand"
    t.string  "model"
    t.decimal "length"
    t.decimal "width"
    t.decimal "height"
    t.integer "nominal_wattage"
  end

  create_table "users", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
