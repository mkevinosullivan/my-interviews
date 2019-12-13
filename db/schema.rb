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

ActiveRecord::Schema.define(version: 2019_12_11_173040) do

  create_table "candidates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_candidates_on_email"
  end

  create_table "job_postings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "description"
    t.string "posting_link"
    t.bigint "questionnaire_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questionnaire_id"], name: "index_job_postings_on_questionnaire_id"
  end

  create_table "candidates_job_postings", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "job_posting_id"
    t.bigint "candidate_id"
    t.index ["candidate_id"], name: "index_candidates_job_postings_on_candidate_id"
    t.index ["job_posting_id"], name: "index_candidates_job_postings_on_job_posting_id"
  end

  create_table "questionnaires", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questionnaires_questions", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.bigint "question_id"
    t.index ["question_id"], name: "index_questionnaires_questions_on_question_id"
    t.index ["questionnaire_id"], name: "index_questionnaires_questions_on_questionnaire_id"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "question", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "responses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "response", null: false
    t.integer "score", null: false
    t.bigint "candidate_id"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "job_posting_id"
    t.index ["candidate_id"], name: "index_responses_on_candidate_id"
    t.index ["job_posting_id"], name: "index_responses_on_job_posting_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

end
