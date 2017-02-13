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

ActiveRecord::Schema.define(version: 20170209031513) do

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "group_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "body",       limit: 65535
    t.string   "image"
    t.integer  "users_id"
    t.integer  "groups_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["groups_id"], name: "index_messages_on_groups_id", using: :btree
    t.index ["users_id"], name: "index_messages_on_users_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["id"], name: "index_users_on_id", using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
  end

  create_table "users_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "users_id"
    t.integer  "groups_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groups_id"], name: "index_users_groups_on_groups_id", using: :btree
    t.index ["users_id"], name: "index_users_groups_on_users_id", using: :btree
  end

  add_foreign_key "messages", "groups", column: "groups_id"
  add_foreign_key "messages", "users", column: "users_id"
  add_foreign_key "users_groups", "groups", column: "groups_id"
  add_foreign_key "users_groups", "users", column: "users_id"
end
