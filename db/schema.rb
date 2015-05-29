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

ActiveRecord::Schema.define(version: 20150529160715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "proposal_users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid "proposal_id", null: false
    t.uuid "user_id",     null: false
  end

  add_index "proposal_users", ["proposal_id"], name: "index_proposal_users_on_proposal_id", using: :btree
  add_index "proposal_users", ["user_id"], name: "index_proposal_users_on_user_id", using: :btree

  create_table "proposals", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.text     "content"
    t.string   "status"
    t.uuid     "thread_id",  default: "8b9e904f-1c7d-41e1-bce5-6e7784cec804", null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "proposals", ["thread_id"], name: "index_proposals_on_thread_id", using: :btree

  create_table "queries", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "proposal_user_id", null: false
    t.string   "status"
    t.datetime "respond_by"
    t.datetime "responded_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "queries", ["proposal_user_id"], name: "index_queries_on_proposal_user_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "proposal_users", "proposals"
  add_foreign_key "proposal_users", "users"
  add_foreign_key "queries", "proposal_users"
end
