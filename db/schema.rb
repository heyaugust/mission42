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

ActiveRecord::Schema.define(version: 20160310163540) do

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "race_packages", force: :cascade do |t|
    t.string   "race_id"
    t.decimal  "price",            precision: 2
    t.decimal  "discounted_price", precision: 2
    t.integer  "quantity"
    t.text     "description"
    t.integer  "early_bird_quota"
    t.integer  "quantity_sold"
    t.string   "campaign_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "team_leader_id"
    t.string   "team_member_email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "purchase_type"
    t.integer  "quantity_purchased"
    t.decimal  "cost_of_purchase",   precision: 2
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                  default: false
    t.string   "activation_digest"
    t.boolean  "activated",              default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "team"
    t.integer  "contact_number"
    t.date     "born_on"
    t.integer  "gender"
    t.text     "address1"
    t.text     "address2"
    t.string   "postal_code"
    t.string   "country_of_residence"
    t.string   "nationality"
    t.string   "emergency_contact_name"
    t.integer  "emergency_contact_no"
    t.boolean  "medical_condition"
    t.integer  "singlet_size"
    t.integer  "socks_size"
    t.string   "racebibname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
