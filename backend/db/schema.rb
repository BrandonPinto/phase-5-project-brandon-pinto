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

ActiveRecord::Schema[7.0].define(version: 2022_10_17_195859) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "community_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "max_participant"
    t.integer "min_participant"
    t.text "title"
    t.text "start"
    t.text "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.text "email"
    t.text "first_name"
    t.text "last_name"
    t.text "company"
    t.text "phone_number"
    t.text "location"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "community_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_events", force: :cascade do |t|
    t.text "title"
    t.text "start"
    t.text "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "personal_event_id"
    t.integer "contact_id"
    t.text "email"
    t.text "username"
    t.text "password_digest"
    t.text "image"
    t.text "alias"
    t.text "pronoun"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
