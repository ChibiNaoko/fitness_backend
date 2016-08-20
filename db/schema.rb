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

ActiveRecord::Schema.define(version: 20160819113932) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "price",      limit: 24
    t.integer  "manager_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["manager_id"], name: "index_items_on_manager_id", using: :btree
  end

  create_table "managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string   "full_name"
    t.string   "user_name"
    t.string   "birthday"
    t.string   "address"
    t.string   "tel_number"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "auth_token"
    t.index ["email"], name: "index_managers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "meetings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "from_date"
    t.datetime "to_date"
    t.integer  "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_meetings_on_manager_id", using: :btree
  end

  create_table "negotiate_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "negotiate_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["item_id"], name: "index_negotiate_items_on_item_id", using: :btree
    t.index ["negotiate_id"], name: "index_negotiate_items_on_negotiate_id", using: :btree
  end

  create_table "negotiates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "manager_id"
    t.integer  "user_id"
    t.datetime "created_date"
    t.float    "total_price",  limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["manager_id"], name: "index_negotiates_on_manager_id", using: :btree
    t.index ["user_id"], name: "index_negotiates_on_user_id", using: :btree
  end

  create_table "user_meetings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_user_meetings_on_meeting_id", using: :btree
    t.index ["user_id"], name: "index_user_meetings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "full_name"
    t.string   "birthday"
    t.string   "tel_number"
    t.string   "address"
    t.float    "salary",        limit: 24
    t.float    "meeting_money", limit: 24
    t.datetime "registry_date"
    t.datetime "expiry_date"
    t.string   "avatar"
    t.integer  "role"
    t.integer  "manager_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["manager_id"], name: "index_users_on_manager_id", using: :btree
  end

  add_foreign_key "items", "managers"
  add_foreign_key "meetings", "managers"
  add_foreign_key "negotiate_items", "items"
  add_foreign_key "negotiate_items", "negotiates"
  add_foreign_key "negotiates", "managers"
  add_foreign_key "negotiates", "users"
  add_foreign_key "user_meetings", "meetings"
  add_foreign_key "user_meetings", "users"
  add_foreign_key "users", "managers"
end
