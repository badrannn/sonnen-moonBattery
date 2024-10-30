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

ActiveRecord::Schema[7.0].define(version: 2024_10_30_121012) do
  create_table "batteries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "mac_address", null: false
    t.string "serial_number", null: false
    t.timestamp "last_ping_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mac_address"], name: "index_batteries_on_mac_address", unique: true
    t.index ["serial_number"], name: "index_batteries_on_serial_number", unique: true
  end

  create_table "battery_configurations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "battery_serial_number", null: false
    t.integer "status", default: 0, null: false
    t.boolean "alerts_enabled", default: true, null: false
    t.integer "performance_mode", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_serial_number"], name: "index_battery_configurations_on_battery_serial_number", unique: true
  end

  add_foreign_key "battery_configurations", "batteries", column: "battery_serial_number", primary_key: "serial_number"
end
