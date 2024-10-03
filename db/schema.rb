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

ActiveRecord::Schema[7.2].define(version: 2024_10_03_231554) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer_value"
    t.bigint "question_id", null: false
    t.bigint "tester_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["session_id"], name: "index_answers_on_session_id"
    t.index ["tester_id"], name: "index_answers_on_tester_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "label"
    t.string "input_type"
    t.jsonb "options"
    t.bigint "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_questions_on_template_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "user_id", null: false
    t.datetime "submitted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_results_on_session_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.bigint "template_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_sessions_on_template_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "sessions"
  add_foreign_key "answers", "users", column: "tester_id"
  add_foreign_key "questions", "templates"
  add_foreign_key "results", "sessions"
  add_foreign_key "results", "users"
  add_foreign_key "sessions", "templates"
  add_foreign_key "sessions", "users"
end
