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

ActiveRecord::Schema.define(version: 2018_06_28_132011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigned_admins", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_assigned_admins_on_team_id"
    t.index ["user_id"], name: "index_assigned_admins_on_user_id"
  end

  create_table "assigned_cards", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "card_id"
    t.string "users"
    t.index ["card_id"], name: "index_assigned_cards_on_card_id"
    t.index ["user_id"], name: "index_assigned_cards_on_user_id"
  end

  create_table "assigned_columns", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_assigned_columns_on_column_id"
    t.index ["team_id"], name: "index_assigned_columns_on_team_id"
  end

  create_table "assigned_teams", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_assigned_teams_on_team_id"
    t.index ["user_id"], name: "index_assigned_teams_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.bigint "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_cards_on_column_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "position"
    t.boolean "shared", default: false
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_columns_on_team_id"
    t.index ["user_id"], name: "index_columns_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admins"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.integer "password"
    t.boolean "admin"
    t.integer "handy_nr"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assigned_admins", "teams"
  add_foreign_key "assigned_admins", "users"
  add_foreign_key "assigned_cards", "cards"
  add_foreign_key "assigned_cards", "users"
  add_foreign_key "assigned_columns", "columns"
  add_foreign_key "assigned_columns", "teams"
  add_foreign_key "assigned_teams", "teams"
  add_foreign_key "assigned_teams", "users"
  add_foreign_key "cards", "columns"
  add_foreign_key "cards", "users"
  add_foreign_key "columns", "teams"
  add_foreign_key "columns", "users"
end
