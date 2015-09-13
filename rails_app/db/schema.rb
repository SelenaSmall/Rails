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

ActiveRecord::Schema.define(version: 20150906070346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "venue_id"
    t.string   "name",            limit: 100, null: false
    t.string   "phone",           limit: 10,  null: false
    t.string   "email",           limit: 100, null: false
    t.datetime "start_time",                  null: false
    t.string   "tab_name",        limit: 10,  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "bookings", ["organisation_id"], name: "index_bookings_on_organisation_id", using: :btree
  add_index "bookings", ["venue_id"], name: "index_bookings_on_venue_id", using: :btree

  create_table "covers", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "covers",       limit: 100, null: false
    t.string   "covers_group", limit: 100, null: false
    t.string   "turn_time",                null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "covers", ["venue_id"], name: "index_covers_on_venue_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "venue_id"
    t.string   "name",            limit: 100, null: false
    t.string   "phone",           limit: 10,  null: false
    t.string   "email",           limit: 100, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "customers", ["organisation_id"], name: "index_customers_on_organisation_id", using: :btree
  add_index "customers", ["venue_id"], name: "index_customers_on_venue_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "grids", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "grid_name",  limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "grids", ["venue_id"], name: "index_grids_on_venue_id", using: :btree

  create_table "hours", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "day",                 limit: 100, null: false
    t.datetime "open_time",                       null: false
    t.datetime "close_time",                      null: false
    t.string   "interval",            limit: 100, null: false
    t.integer  "covers_per_interval",             null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "hours", ["venue_id"], name: "index_hours_on_venue_id", using: :btree

  create_table "incomes", force: :cascade do |t|
    t.integer  "wages"
    t.integer  "other_income"
    t.integer  "income_total"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name",           limit: 128, null: false
    t.string   "phone",          limit: 12,  null: false
    t.string   "address",        limit: 128, null: false
    t.string   "email",          limit: 128, null: false
    t.string   "number_of_tabs", limit: 128, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "slug"
  end

  add_index "organisations", ["slug"], name: "index_organisations_on_slug", using: :btree

  create_table "sections", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "section",    limit: 100, null: false
    t.string   "first_num",  limit: 100, null: false
    t.string   "last_num",   limit: 100, null: false
    t.string   "bookable",   limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sections", ["venue_id"], name: "index_sections_on_venue_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.integer  "venue_id"
    t.integer  "grid_id"
    t.string   "tab",           limit: 100, null: false
    t.string   "section",       limit: 100, null: false
    t.integer  "min_covers",                null: false
    t.integer  "max_covers",                null: false
    t.integer  "booking_order",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tables", ["grid_id"], name: "index_tables_on_grid_id", using: :btree
  add_index "tables", ["venue_id"], name: "index_tables_on_venue_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "venue_id"
    t.string   "user_name",       limit: 100, null: false
    t.string   "password",        limit: 100, null: false
    t.string   "first_name",      limit: 100, null: false
    t.string   "last_name",       limit: 100, null: false
    t.string   "email",           limit: 100, null: false
    t.string   "phone",           limit: 100, null: false
    t.string   "facebook",        limit: 100, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["organisation_id"], name: "index_users_on_organisation_id", using: :btree
  add_index "users", ["venue_id"], name: "index_users_on_venue_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.integer  "organisation_id"
    t.string   "name",            limit: 100, null: false
    t.string   "phone",           limit: 10,  null: false
    t.string   "email",           limit: 100, null: false
    t.string   "address",         limit: 128, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "slug"
  end

  add_index "venues", ["organisation_id"], name: "index_venues_on_organisation_id", using: :btree
  add_index "venues", ["slug"], name: "index_venues_on_slug", using: :btree

end
