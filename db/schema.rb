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

ActiveRecord::Schema.define(version: 20150130203403) do

  create_table "members", force: :cascade do |t|
    t.string   "last_name",               limit: 255,                null: false
    t.string   "first_name",              limit: 255,                null: false
    t.string   "email",                   limit: 255
    t.string   "password_digest",         limit: 255
    t.integer  "status_id",               limit: 4
    t.date     "registered_on"
    t.boolean  "exempt_of_contributions", limit: 1
    t.string   "street",                  limit: 255
    t.string   "postal_code",             limit: 255
    t.string   "city",                    limit: 255
    t.string   "country",                 limit: 255
    t.string   "website",                 limit: 255
    t.string   "phone_number",            limit: 255
    t.string   "mobile_number",           limit: 255
    t.boolean  "active",                  limit: 1,   default: true
    t.integer  "created_by",              limit: 4
    t.integer  "updated_by",              limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

end
