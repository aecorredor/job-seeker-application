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

ActiveRecord::Schema.define(version: 20161129212227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "address"
    t.text     "information"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "employers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "rep_fname"
    t.string   "rep_lname"
    t.string   "phone"
    t.string   "address"
    t.date     "founded"
    t.text     "company_info"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "employers", ["email"], name: "index_employers_on_email", unique: true, using: :btree
  add_index "employers", ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true, using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.text     "cover_letter"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "job_posting_id"
    t.integer  "seeker_id"
  end

  add_index "job_applications", ["job_posting_id"], name: "index_job_applications_on_job_posting_id", using: :btree
  add_index "job_applications", ["seeker_id"], name: "index_job_applications_on_seeker_id", using: :btree

  create_table "job_postings", force: :cascade do |t|
    t.string   "position"
    t.string   "location"
    t.string   "job_type"
    t.text     "job_description"
    t.float    "pay"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "employer_id"
  end

  add_index "job_postings", ["employer_id"], name: "index_job_postings_on_employer_id", using: :btree

  create_table "seekers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "address"
    t.text     "interests"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "about"
    t.string   "major"
    t.string   "work_experience1_title"
    t.string   "work_experience2_title"
    t.string   "work_experience3_title"
    t.string   "work_experience1_company"
    t.string   "work_experience2_company"
    t.string   "work_experience3_company"
    t.date     "work_experience1_start"
    t.date     "work_experience2_start"
    t.date     "work_experience3_start"
    t.date     "work_experience1_end"
    t.date     "work_experience2_end"
    t.date     "work_experience3_end"
    t.text     "work_experience1_description"
    t.text     "work_experience2_description"
    t.text     "work_experience3_description"
    t.string   "email",                        default: "", null: false
    t.string   "encrypted_password",           default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "university"
  end

  add_index "seekers", ["email"], name: "index_seekers_on_email", unique: true, using: :btree
  add_index "seekers", ["reset_password_token"], name: "index_seekers_on_reset_password_token", unique: true, using: :btree

end
