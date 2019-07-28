# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_27_025401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_tokens", force: :cascade do |t|
    t.string "token", null: false
    t.string "secret_token_hash", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_client_tokens_on_token", unique: true
  end

  create_table "event_schedules", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.date "date", null: false
    t.integer "capacity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_schedules_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "place", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_events_on_owner_id"
  end

  create_table "user_to_event_schedules", force: :cascade do |t|
    t.bigint "event_schedule_id", null: false
    t.bigint "user_id", null: false
    t.string "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_schedule_id"], name: "index_user_to_event_schedules_on_event_schedule_id"
    t.index ["user_id"], name: "index_user_to_event_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
