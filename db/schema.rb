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

ActiveRecord::Schema.define(version: 2020_07_13_130535) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_number"
    t.integer "phone", limit: 11
    t.string "city"
    t.string "addr_1"
    t.text "addr_2"
    t.text "desc"
    t.boolean "del_flag", default: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["name"], name: "index_admins_on_name", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "booking_rooms", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.integer "room_id", null: false
    t.integer "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_booking_rooms_on_booking_id"
    t.index ["hotel_id"], name: "index_booking_rooms_on_hotel_id"
    t.index ["room_id"], name: "index_booking_rooms_on_room_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "check_in_day"
    t.boolean "pay_flag", default: false
    t.string "book_status"
    t.datetime "check_out_day"
    t.string "book_user_name", null: false
    t.string "book_user_phone", null: false
    t.string "book_user_number", null: false
    t.integer "book_people_number", default: 0
    t.integer "book_total_amount", default: 0
    t.text "book_memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.string "hotel_code", null: false
    t.string "phone"
    t.boolean "public"
    t.string "city"
    t.string "addr_1"
    t.text "addr_2"
    t.text "desc_s"
    t.text "desc"
    t.integer "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_hotels_on_admin_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "code", null: false
    t.integer "price", null: false
    t.integer "hotel_id", null: false
    t.integer "room_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_rooms", "bookings"
  add_foreign_key "booking_rooms", "hotels"
  add_foreign_key "booking_rooms", "rooms"
  add_foreign_key "rooms", "hotels"
  add_foreign_key "rooms", "room_types"
end
