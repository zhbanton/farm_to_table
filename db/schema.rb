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

ActiveRecord::Schema.define(version: 20140823020358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_days", force: true do |t|
    t.string   "day"
    t.string   "opening_time"
    t.string   "closing_time"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_days", ["farm_id"], name: "index_business_days_on_farm_id", using: :btree

  create_table "farms", force: true do |t|
    t.decimal  "minimum_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "business_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postings", force: true do |t|
    t.decimal  "quantity"
    t.string   "unit"
    t.decimal  "price_per_unit"
    t.date     "starting_date"
    t.date     "expiration_date"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postings", ["product_id"], name: "index_postings_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "variety"
    t.text     "description"
    t.boolean  "organic"
    t.boolean  "non_gmo"
    t.boolean  "no_spray"
    t.boolean  "low_spray"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "default_price"
    t.string   "default_unit"
  end

  add_index "products", ["farm_id"], name: "index_products_on_farm_id", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["variety"], name: "index_products_on_variety", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                null: false
    t.text     "description"
    t.string   "website"
    t.string   "phone_number"
    t.integer  "role_id"
    t.string   "role_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id", "role_type"], name: "index_users_on_role_id_and_role_type", using: :btree

end
