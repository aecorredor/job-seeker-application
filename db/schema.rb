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

ActiveRecord::Schema.define(version: 20161126210223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.text     "information"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "employers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "rep_fname"
    t.string   "rep_lname"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.date     "founded"
    t.text     "company_info"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "job_postings_id"
    t.string   "password_digest"
  end

  add_index "employers", ["job_postings_id"], name: "index_employers_on_job_postings_id", using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.text     "cover_letter"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "job_postings", force: :cascade do |t|
    t.string   "position"
    t.string   "location"
    t.string   "job_type"
    t.text     "job_description"
    t.float    "pay"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "job_applications_id"
  end

  add_index "job_postings", ["job_applications_id"], name: "index_job_postings_on_job_applications_id", using: :btree

  create_table "seekers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.text     "interests"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "job_applications_id"
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
    t.string   "password_digest"
  end

  add_index "seekers", ["job_applications_id"], name: "index_seekers_on_job_applications_id", using: :btree

end
