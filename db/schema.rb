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

ActiveRecord::Schema.define(version: 20160724181644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "main",                   default: false
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

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "course_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "course_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "course_anc_desc_idx", unique: true, using: :btree
  add_index "course_hierarchies", ["descendant_id"], name: "course_desc_idx", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "public_description", default: ""
    t.integer  "level"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "parent_id"
    t.string   "slug"
    t.text     "full_description",   default: ""
  end

  add_index "courses", ["slug"], name: "index_courses_on_slug", unique: true, using: :btree

  create_table "courses_students", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses_students", ["course_id"], name: "index_courses_students_on_course_id", using: :btree
  add_index "courses_students", ["student_id"], name: "index_courses_students_on_student_id", using: :btree

  create_table "dance_plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "lessons_per_week"
    t.decimal  "price"
    t.decimal  "price_with_discount"
    t.decimal  "tuition"
    t.decimal  "leveling"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "canton_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["canton_id"], name: "index_districts_on_canton_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

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

  create_table "invoice_items", force: :cascade do |t|
    t.integer  "invoice_id",          null: false
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.decimal  "price_with_discount"
  end

  add_index "invoice_items", ["invoice_id"], name: "index_invoice_items_on_invoice_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.boolean  "payed",                default: false
    t.integer  "student_id"
    t.text     "description"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "sent",                 default: false
    t.boolean  "confirmed",            default: false
    t.boolean  "payed_with_discount",  default: false
    t.boolean  "should_be_auto_payed", default: false
    t.boolean  "partial",              default: false
    t.integer  "course_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "course_id"
    t.integer  "instructor_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.time     "start_time",                null: false
    t.time     "end_time",                  null: false
    t.integer  "day_of_week",   default: 1, null: false
    t.integer  "quota",         default: 0, null: false
  end

  add_index "lessons", ["branch_id"], name: "index_lessons_on_branch_id", using: :btree
  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree
  add_index "lessons", ["instructor_id"], name: "index_lessons_on_instructor_id", using: :btree

  create_table "lessons_students", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lessons_students", ["lesson_id"], name: "index_lessons_students_on_lesson_id", using: :btree
  add_index "lessons_students", ["student_id"], name: "index_lessons_students_on_student_id", using: :btree

  create_table "other_plans", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price_per_lesson"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "invoice_id"
    t.decimal  "sum"
    t.string   "comment"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "accepted",       default: false
    t.integer  "method"
    t.integer  "payment_system"
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "requirement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "image_meta"
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
    t.string   "id_number"
    t.boolean  "beginner"
    t.date     "birthdate"
    t.string   "second_last_name"
    t.integer  "status"
  end

  add_index "students", ["branch_id"], name: "index_students_on_branch_id", using: :btree
  add_index "students", ["district_id"], name: "index_students_on_district_id", using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["id_number"], name: "index_students_on_id_number", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "dance_plan_id"
    t.date     "finished_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "title"
  end

end
