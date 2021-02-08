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

ActiveRecord::Schema.define(version: 2021_02_08_150741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.integer "approval", default: 0, null: false
    t.integer "status"
    t.bigint "request_id"
    t.bigint "coordinator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinator_id"], name: "index_contracts_on_coordinator_id"
    t.index ["request_id"], name: "index_contracts_on_request_id"
  end

  create_table "coordinators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "user_name", null: false
    t.integer "sex", null: false
    t.date "birthday", null: false
    t.string "occupation", null: false
    t.index ["email"], name: "index_coordinators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_coordinators_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "resident_id"
    t.integer "interior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interiors", force: :cascade do |t|
    t.text "design_img", null: false
    t.date "date_of_creation", null: false
    t.integer "budget"
    t.text "description"
    t.bigint "coordinator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinator_id"], name: "index_interiors_on_coordinator_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "room_size", null: false
    t.text "room_img", null: false
    t.integer "budget"
    t.date "deadline", null: false
    t.text "remarks", null: false
    t.bigint "resident_id"
    t.bigint "coordinator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinator_id"], name: "index_requests_on_coordinator_id"
    t.index ["resident_id"], name: "index_requests_on_resident_id"
  end

  create_table "residents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "user_name", null: false
    t.integer "sex", null: false
    t.date "birthday", null: false
    t.index ["email"], name: "index_residents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_residents_on_reset_password_token", unique: true
  end

  add_foreign_key "contracts", "coordinators"
  add_foreign_key "contracts", "requests"
  add_foreign_key "interiors", "coordinators"
  add_foreign_key "requests", "coordinators"
  add_foreign_key "requests", "residents"
end
