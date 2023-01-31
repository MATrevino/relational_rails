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

ActiveRecord::Schema.define(version: 2023_01_30_225243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_shops", force: :cascade do |t|
    t.string "name"
    t.integer "open_year"
    t.boolean "open_after_five"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drinks", force: :cascade do |t|
    t.bigint "coffee_shop_id"
    t.string "integer"
    t.string "name"
    t.boolean "hot_drink"
    t.integer "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["coffee_shop_id"], name: "index_drinks_on_coffee_shop_id"
  end

  add_foreign_key "drinks", "coffee_shops"
end
