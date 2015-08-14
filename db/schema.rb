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

ActiveRecord::Schema.define(version: 20150101000011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "label",                     null: false
    t.string   "reference",                 null: false
    t.boolean  "active",     default: true, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "activities", force: :cascade do |t|
    t.string   "label",                     null: false
    t.boolean  "active",     default: true, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "contribution_types", force: :cascade do |t|
    t.string   "label",                                                      null: false
    t.date     "expires_on",                                                 null: false
    t.decimal  "amount",              precision: 5, scale: 2,                null: false
    t.integer  "contributions_count",                         default: 0,    null: false
    t.boolean  "active",                                      default: true, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.integer  "account_id",                                   null: false
    t.integer  "contribution_type_id",                         null: false
    t.integer  "member_id",                                    null: false
    t.date     "date",                                         null: false
    t.decimal  "amount",               precision: 5, scale: 2, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "contributions", ["account_id"], name: "index_contributions_on_account_id", using: :btree
  add_index "contributions", ["contribution_type_id"], name: "index_contributions_on_contribution_type_id", using: :btree
  add_index "contributions", ["member_id"], name: "index_contributions_on_member_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.string   "label",                      null: false
    t.decimal  "amount",                     null: false
    t.integer  "account_id",                 null: false
    t.integer  "activity_id",                null: false
    t.date     "date",                       null: false
    t.boolean  "paid",        default: true, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "expenses", ["account_id"], name: "index_expenses_on_account_id", using: :btree
  add_index "expenses", ["activity_id"], name: "index_expenses_on_activity_id", using: :btree

  create_table "incomes", force: :cascade do |t|
    t.string   "label",                      null: false
    t.decimal  "amount",                     null: false
    t.integer  "account_id",                 null: false
    t.integer  "activity_id",                null: false
    t.date     "date",                       null: false
    t.boolean  "received",    default: true, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "incomes", ["account_id"], name: "index_incomes_on_account_id", using: :btree
  add_index "incomes", ["activity_id"], name: "index_incomes_on_activity_id", using: :btree

  create_table "mailings", force: :cascade do |t|
    t.string   "from",       null: false
    t.text     "to",         null: false
    t.string   "subject",    null: false
    t.text     "body",       null: false
    t.integer  "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "last_name",                               null: false
    t.string   "first_name",                              null: false
    t.string   "email"
    t.string   "password_digest"
    t.integer  "status_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.date     "registered_on"
    t.boolean  "exempt_of_contributions", default: false
    t.string   "street"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "website"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "active",                  default: true,  null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "members", ["status_id"], name: "index_members_on_status_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.integer  "member_id",  null: false
    t.string   "action",     null: false
    t.string   "controller", null: false
    t.integer  "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "permissions", ["member_id"], name: "index_permissions_on_member_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "label",                        null: false
    t.integer  "members_count", default: 0,    null: false
    t.boolean  "active",        default: true, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_foreign_key "accounts", "members", column: "created_by"
  add_foreign_key "accounts", "members", column: "updated_by"
  add_foreign_key "activities", "members", column: "created_by"
  add_foreign_key "activities", "members", column: "updated_by"
  add_foreign_key "contribution_types", "members", column: "created_by"
  add_foreign_key "contribution_types", "members", column: "updated_by"
  add_foreign_key "contributions", "accounts"
  add_foreign_key "contributions", "contribution_types"
  add_foreign_key "contributions", "members"
  add_foreign_key "contributions", "members", column: "created_by"
  add_foreign_key "contributions", "members", column: "updated_by"
  add_foreign_key "expenses", "accounts"
  add_foreign_key "expenses", "activities"
  add_foreign_key "expenses", "members", column: "created_by"
  add_foreign_key "expenses", "members", column: "updated_by"
  add_foreign_key "incomes", "accounts"
  add_foreign_key "incomes", "activities"
  add_foreign_key "incomes", "members", column: "created_by"
  add_foreign_key "incomes", "members", column: "updated_by"
  add_foreign_key "mailings", "members", column: "created_by"
  add_foreign_key "members", "members", column: "created_by"
  add_foreign_key "members", "members", column: "updated_by"
  add_foreign_key "members", "statuses"
  add_foreign_key "permissions", "members"
  add_foreign_key "permissions", "members", column: "created_by"
  add_foreign_key "statuses", "members", column: "created_by"
  add_foreign_key "statuses", "members", column: "updated_by"
end
