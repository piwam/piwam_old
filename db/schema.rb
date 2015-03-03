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

  create_table "accounts", force: :cascade do |t|
    t.string   "label",      limit: 255,                null: false
    t.string   "reference",  limit: 255,                null: false
    t.boolean  "active",     limit: 1,   default: true, null: false
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "accounts", ["created_by"], name: "fk_rails_a63bb70510", using: :btree
  add_index "accounts", ["updated_by"], name: "fk_rails_767774279c", using: :btree

  create_table "activities", force: :cascade do |t|
    t.string   "label",      limit: 255,                null: false
    t.boolean  "active",     limit: 1,   default: true, null: false
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "activities", ["created_by"], name: "fk_rails_bc141f52be", using: :btree
  add_index "activities", ["updated_by"], name: "fk_rails_35c0184764", using: :btree

  create_table "contribution_types", force: :cascade do |t|
    t.string   "label",               limit: 255,                                        null: false
    t.date     "expires_on",                                                             null: false
    t.decimal  "amount",                          precision: 5, scale: 2,                null: false
    t.integer  "contributions_count", limit: 4,                           default: 0,    null: false
    t.boolean  "active",              limit: 1,                           default: true, null: false
    t.integer  "created_by",          limit: 4
    t.integer  "updated_by",          limit: 4
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
  end

  add_index "contribution_types", ["created_by"], name: "fk_rails_3906160fa1", using: :btree
  add_index "contribution_types", ["updated_by"], name: "fk_rails_fc942c29e4", using: :btree

  create_table "contributions", force: :cascade do |t|
    t.integer  "account_id",           limit: 4,                         null: false
    t.integer  "contribution_type_id", limit: 4,                         null: false
    t.integer  "member_id",            limit: 4,                         null: false
    t.date     "date",                                                   null: false
    t.decimal  "amount",                         precision: 5, scale: 2, null: false
    t.integer  "created_by",           limit: 4
    t.integer  "updated_by",           limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "contributions", ["account_id"], name: "index_contributions_on_account_id", using: :btree
  add_index "contributions", ["contribution_type_id"], name: "index_contributions_on_contribution_type_id", using: :btree
  add_index "contributions", ["created_by"], name: "fk_rails_a47cec16b7", using: :btree
  add_index "contributions", ["member_id"], name: "index_contributions_on_member_id", using: :btree
  add_index "contributions", ["updated_by"], name: "fk_rails_0044e914d9", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.string   "label",       limit: 255,                               null: false
    t.decimal  "amount",                  precision: 10,                null: false
    t.integer  "account_id",  limit: 4,                                 null: false
    t.integer  "activity_id", limit: 4,                                 null: false
    t.date     "date",                                                  null: false
    t.boolean  "paid",        limit: 1,                  default: true, null: false
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "expenses", ["account_id"], name: "index_expenses_on_account_id", using: :btree
  add_index "expenses", ["activity_id"], name: "index_expenses_on_activity_id", using: :btree
  add_index "expenses", ["created_by"], name: "fk_rails_df8929665e", using: :btree
  add_index "expenses", ["updated_by"], name: "fk_rails_186f854a24", using: :btree

  create_table "incomes", force: :cascade do |t|
    t.string   "label",       limit: 255,                               null: false
    t.decimal  "amount",                  precision: 10,                null: false
    t.integer  "account_id",  limit: 4,                                 null: false
    t.integer  "activity_id", limit: 4,                                 null: false
    t.date     "date",                                                  null: false
    t.boolean  "received",    limit: 1,                  default: true, null: false
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "incomes", ["account_id"], name: "index_incomes_on_account_id", using: :btree
  add_index "incomes", ["activity_id"], name: "index_incomes_on_activity_id", using: :btree
  add_index "incomes", ["created_by"], name: "fk_rails_9a27a3c2b6", using: :btree
  add_index "incomes", ["updated_by"], name: "fk_rails_4c9c0935f6", using: :btree

  create_table "mailings", force: :cascade do |t|
    t.string   "from",       limit: 255,   null: false
    t.string   "to",         limit: 255,   null: false
    t.string   "subject",    limit: 255,   null: false
    t.text     "body",       limit: 65535, null: false
    t.integer  "created_by", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "mailings", ["created_by"], name: "fk_rails_da6d6d8c5b", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "last_name",               limit: 255,                 null: false
    t.string   "first_name",              limit: 255,                 null: false
    t.string   "email",                   limit: 255
    t.string   "password_digest",         limit: 255
    t.integer  "status_id",               limit: 4
    t.string   "photo_file_name",         limit: 255
    t.string   "photo_content_type",      limit: 255
    t.integer  "photo_file_size",         limit: 4
    t.datetime "photo_updated_at"
    t.date     "registered_on"
    t.boolean  "exempt_of_contributions", limit: 1,   default: false
    t.string   "street",                  limit: 255
    t.string   "postal_code",             limit: 255
    t.string   "city",                    limit: 255
    t.string   "country",                 limit: 255
    t.string   "website",                 limit: 255
    t.string   "phone_number",            limit: 255
    t.string   "mobile_number",           limit: 255
    t.float    "latitude",                limit: 24
    t.float    "longitude",               limit: 24
    t.boolean  "active",                  limit: 1,   default: true,  null: false
    t.integer  "created_by",              limit: 4
    t.integer  "updated_by",              limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "members", ["created_by"], name: "fk_rails_56e01f1bb3", using: :btree
  add_index "members", ["status_id"], name: "index_members_on_status_id", using: :btree
  add_index "members", ["updated_by"], name: "fk_rails_47e4153de1", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.integer  "member_id",  limit: 4,   null: false
    t.string   "action",     limit: 255, null: false
    t.string   "controller", limit: 255, null: false
    t.integer  "created_by", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "permissions", ["created_by"], name: "fk_rails_ab7f7d9747", using: :btree
  add_index "permissions", ["member_id"], name: "index_permissions_on_member_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "label",         limit: 255,                null: false
    t.integer  "members_count", limit: 4,   default: 0,    null: false
    t.boolean  "active",        limit: 1,   default: true, null: false
    t.integer  "created_by",    limit: 4
    t.integer  "updated_by",    limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "statuses", ["created_by"], name: "fk_rails_2eaced9e39", using: :btree
  add_index "statuses", ["updated_by"], name: "fk_rails_11cc7eda14", using: :btree

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
