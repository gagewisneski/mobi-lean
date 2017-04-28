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

ActiveRecord::Schema.define(version: 20170428173513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diets", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "weight",            precision: 4, scale: 1
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "day"
    t.integer  "nuts_and_seeds",                            default: 0
    t.integer  "greek_yogurt",                              default: 0
    t.integer  "cheese",                                    default: 0
    t.integer  "almond_butter",                             default: 0
    t.integer  "zoodles",                                   default: 0
    t.integer  "spaghetti_squash",                          default: 0
    t.integer  "hummus_and_guac",                           default: 0
    t.integer  "cottage_cheese",                            default: 0
    t.integer  "fruit",                                     default: 0
    t.integer  "happy",                                     default: 0
    t.integer  "bean",                                      default: 0
    t.integer  "chocolate_bar",                             default: 0
    t.boolean  "hawaiian_nut_fast"
    t.boolean  "hour_fast_18"
    t.boolean  "cheat_meal"
    t.integer  "program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "start_date"
    t.string   "end_date"
    t.boolean  "active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "activation_digest"
    t.boolean  "activated",         default: true
  end

  create_table "users_programs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
