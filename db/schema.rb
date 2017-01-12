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

ActiveRecord::Schema.define(version: 20170112171309) do

  create_table "academic_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "type"
    t.string   "cert_earned"
    t.string   "institution"
    t.string   "duration"
    t.integer  "staff_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "archive_staffs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "id"
    t.string   "staff_id"
    t.date     "date_join"
    t.string   "first_name",                default: "",   null: false
    t.string   "last_name",                 default: "",   null: false
    t.string   "gender",                    default: "",   null: false
    t.date     "date_of_birth"
    t.string   "qualification"
    t.integer  "staff_grade_id"
    t.integer  "staff_category_id"
    t.integer  "staff_department_id"
    t.integer  "staff_position_id"
    t.date     "date_of_first_appointment"
    t.string   "marital_status"
    t.string   "spouse_name"
    t.integer  "no_of_children"
    t.string   "image"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.boolean  "active",                    default: true, null: false
    t.string   "religion"
    t.integer  "user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "badges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "programme_id"
    t.integer  "level_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "calendars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "guardians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "occupation"
    t.string   "relation"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "phone"
    t.string   "email"
    t.string   "education"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "lev"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programmes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "code"
  end

  create_table "searchstaffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "staff_id"
    t.string  "first_name"
    t.string  "last_name"
    t.integer "staff_category_id"
    t.integer "staff_department_id"
  end

  create_table "staff_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "staff_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "staff_grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "staff_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "staff_positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "staff_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "staffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "staff_id"
    t.date     "date_join"
    t.string   "first_name",                default: "",        null: false
    t.string   "last_name",                 default: "",        null: false
    t.string   "gender",                    default: "",        null: false
    t.date     "date_of_birth"
    t.string   "qualification"
    t.integer  "academic_record_id"
    t.integer  "staff_grade_id"
    t.integer  "staff_category_id"
    t.integer  "staff_department_id"
    t.integer  "staff_position_id"
    t.date     "date_of_first_appointment"
    t.string   "marital_status"
    t.string   "spouse_name"
    t.integer  "no_of_children"
    t.string   "image"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "status",                    default: "Current", null: false
    t.string   "religion"
    t.integer  "user_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["email"], name: "index_staffs_on_email", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "placed_id"
    t.date     "placed_date"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "religion"
    t.integer  "programme_id"
    t.integer  "badge_id"
    t.string   "house"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "phone"
    t.string   "email"
    t.integer  "guardian_id"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["badge_id"], name: "index_students_on_badge_id", using: :btree
    t.index ["placed_id"], name: "index_students_on_placed_id", using: :btree
    t.index ["programme_id"], name: "index_students_on_programme_id", using: :btree
  end

  create_table "terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "calendar_id"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["calendar_id"], name: "index_terms_on_calendar_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "role"
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "password_digest"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

end
