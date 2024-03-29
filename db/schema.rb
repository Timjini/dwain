# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_21_134634) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "athletes", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "height"
    t.string "weight"
    t.string "email"
    t.string "phone"
    t.string "school_name"
    t.string "address"
    t.string "city"
    t.string "power_of_ten"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_athletes_on_user_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
    t.string "phone"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.integer "height"
    t.integer "weight"
    t.string "coach_type"
    t.boolean "is_admin", default: false
    t.boolean "is_active", default: false
    t.index ["email"], name: "index_coaches_on_email", unique: true
    t.index ["reset_password_token"], name: "index_coaches_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "student_performance", default: {}
    t.index ["coach_id"], name: "index_feedbacks_on_coach_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "individual_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "coach_id", null: false
    t.date "session_date"
    t.time "session_time"
    t.integer "duration"
    t.string "location"
    t.string "status"
    t.string "booking_type"
    t.string "payment_status"
    t.string "payment_method"
    t.string "payment_id"
    t.string "payment_amount"
    t.string "payment_currency"
    t.string "payment_description"
    t.string "student_full_name"
    t.string "student_email"
    t.string "student_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_individual_sessions_on_coach_id"
    t.index ["user_id"], name: "index_individual_sessions_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.float "amout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "team_memberships", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_memberships_on_team_id"
    t.index ["user_id"], name: "index_team_memberships_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "coach_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_teams_on_coach_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "content"
    t.string "person"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_sessions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "coach_id"
    t.integer "sets"
    t.integer "reps"
    t.string "distance"
    t.string "duration"
    t.string "recovery"
    t.string "training_type"
    t.string "day"
    t.string "rpe"
    t.string "initiation"
    t.string "footwear"
    t.string "surface"
    t.string "extra_info"
    t.string "pacing_times"
    t.string "media"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.date "date"
    t.string "session_100m_200m"
    t.string "distance_100m_200m"
    t.string "session_200m_400m"
    t.string "distance_200m_400m"
    t.string "sets_reps"
    t.string "recovery"
    t.string "effort"
    t.string "volume"
    t.string "media"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
    t.string "phone"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.integer "height"
    t.integer "weight"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.string "title"
    t.date "release_date"
    t.string "video_link"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_workouts_on_coach_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "feedbacks", "coaches"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "individual_sessions", "coaches"
  add_foreign_key "individual_sessions", "users"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "team_memberships", "teams"
  add_foreign_key "team_memberships", "users"
  add_foreign_key "teams", "coaches"
  add_foreign_key "workouts", "coaches"
end
