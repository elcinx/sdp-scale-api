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

ActiveRecord::Schema[8.0].define(version: 2025_10_22_173648) do
  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.integer "scale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_code"
    t.string "response_type"
    t.text "options"
    t.text "text"
    t.index ["scale_id"], name: "index_questions_on_scale_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text "answer"
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "submitted_at"
    t.integer "respondent_id"
    t.text "meta"
    t.integer "survey_id", null: false
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["survey_id"], name: "index_responses_on_survey_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "scales", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain"
    t.string "version"
    t.string "sdp_doi"
    t.string "status"
    t.index ["user_id"], name: "index_scales_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.string "distribution_mode"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "scale_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_surveys_on_scale_id"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
  end

  create_table "validation_reports", force: :cascade do |t|
    t.float "reliability"
    t.text "notes"
    t.integer "scale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_validation_reports_on_scale_id"
  end

  add_foreign_key "questions", "scales"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "surveys"
  add_foreign_key "responses", "users"
  add_foreign_key "scales", "users"
  add_foreign_key "surveys", "scales"
  add_foreign_key "surveys", "users"
  add_foreign_key "validation_reports", "scales"
end
