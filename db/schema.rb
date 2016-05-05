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

ActiveRecord::Schema.define(version: 20160505082701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches_instructors", force: :cascade do |t|
    t.integer "branch_id"
    t.integer "instructor_id"
  end

  add_index "branches_instructors", ["branch_id"], name: "index_branches_instructors_on_branch_id", using: :btree
  add_index "branches_instructors", ["instructor_id"], name: "index_branches_instructors_on_instructor_id", using: :btree

  create_table "cantons", force: :cascade do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cantons", ["province_id"], name: "index_cantons_on_province_id", using: :btree

  create_table "course_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "course_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "course_anc_desc_idx", unique: true, using: :btree
  add_index "course_hierarchies", ["descendant_id"], name: "course_desc_idx", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "level"
    t.integer  "quota"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "parent_id"
  end

  create_table "courses_students", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses_students", ["course_id"], name: "index_courses_students_on_course_id", using: :btree
  add_index "courses_students", ["student_id"], name: "index_courses_students_on_student_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "canton_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["canton_id"], name: "index_districts_on_canton_id", using: :btree

  create_table "instructors", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "district_id"
    t.integer  "branch_id"
  end

  add_index "instructors", ["branch_id"], name: "index_instructors_on_branch_id", using: :btree
  add_index "instructors", ["district_id"], name: "index_instructors_on_district_id", using: :btree
  add_index "instructors", ["email"], name: "index_instructors_on_email", unique: true, using: :btree
  add_index "instructors", ["reset_password_token"], name: "index_instructors_on_reset_password_token", unique: true, using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "course_id"
    t.integer  "instructor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "start_time",    null: false
    t.datetime "end_time",      null: false
  end

  add_index "lessons", ["branch_id"], name: "index_lessons_on_branch_id", using: :btree
  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree
  add_index "lessons", ["instructor_id"], name: "index_lessons_on_instructor_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "district_id"
    t.integer  "branch_id"
  end

  add_index "students", ["branch_id"], name: "index_students_on_branch_id", using: :btree
  add_index "students", ["district_id"], name: "index_students_on_district_id", using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

end
