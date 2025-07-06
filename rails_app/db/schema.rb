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

ActiveRecord::Schema[8.0].define(version: 2025_07_06_130626) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "collaborators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "sector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: true
    t.index ["sector_id"], name: "index_collaborators_on_sector_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: true
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.date "due_date"
    t.integer "task_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "collaborator_id", null: false
    t.index ["collaborator_id"], name: "index_tasks_on_collaborator_id"
  end

  add_foreign_key "collaborators", "sectors"
  add_foreign_key "tasks", "collaborators"
end
