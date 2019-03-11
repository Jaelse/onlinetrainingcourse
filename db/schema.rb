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

ActiveRecord::Schema.define(version: 2019_03_11_220920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "subscription_id"
    t.date "class_date"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_attendances_on_course_id"
    t.index ["subscription_id"], name: "index_attendances_on_subscription_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.bigint "subscriber_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id"], name: "index_courses_on_subscriber_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "course_id"
    t.text "project"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_name"
    t.index ["course_id"], name: "index_groups_on_course_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "course_id"
    t.date "class_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "class_started"
    t.boolean "class_ended"
    t.index ["course_id"], name: "index_logs_on_course_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "citizenid"
    t.integer "substype"
    t.string "insorstid"
    t.string "dept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_subscribers_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "subscriber_id"
    t.bigint "course_id"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["course_id"], name: "index_subscriptions_on_course_id"
    t.index ["group_id"], name: "index_subscriptions_on_group_id"
    t.index ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "subscriptions"
  add_foreign_key "courses", "subscribers"
  add_foreign_key "groups", "courses"
  add_foreign_key "logs", "courses"
  add_foreign_key "subscribers", "users"
  add_foreign_key "subscriptions", "courses"
  add_foreign_key "subscriptions", "groups"
  add_foreign_key "subscriptions", "subscribers"
end
