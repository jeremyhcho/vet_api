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

ActiveRecord::Schema.define(version: 20170924234244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_levels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "from", null: false
    t.datetime "to", null: false
    t.string "title", null: false
    t.text "description"
    t.integer "location_id"
    t.integer "creator_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_appointments_on_location_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_companies_on_owner_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "company_name"
    t.string "address"
    t.string "email"
    t.string "phone_number"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_customers_on_company_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "address"
    t.string "zip"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "image_url"
    t.integer "company_id"
    t.integer "price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "products_option_values", force: :cascade do |t|
    t.string "option_value", null: false
    t.integer "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_products_option_values_on_option_id"
  end

  create_table "products_options", force: :cascade do |t|
    t.string "option_name"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_options_on_product_id"
  end

  create_table "products_variant_values", force: :cascade do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_value_id"], name: "index_products_variant_values_on_option_value_id"
    t.index ["variant_id"], name: "index_products_variant_values_on_variant_id"
  end

  create_table "products_variants", force: :cascade do |t|
    t.integer "product_id"
    t.integer "price_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_variants_on_product_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "token", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me"
    t.index ["token"], name: "index_sessions_on_token", unique: true
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password_digest", null: false
    t.string "profile_picture"
    t.string "status"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
