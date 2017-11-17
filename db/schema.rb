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

ActiveRecord::Schema.define(version: 20171117071029) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_categories_on_creator_id"
  end

  create_table "incomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "month_id"
    t.integer "user_id"
    t.integer "category_id"
    t.string "name"
    t.float "value", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.boolean "main_income", default: false
    t.index ["category_id"], name: "index_incomes_on_category_id"
    t.index ["month_id"], name: "index_incomes_on_month_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "installments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "item_buying_id"
    t.float "real_value", limit: 24
    t.integer "value_by_month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_buying_id"], name: "index_installments_on_item_buying_id"
    t.index ["user_id"], name: "index_installments_on_user_id"
    t.index ["value_by_month_id"], name: "index_installments_on_value_by_month_id"
  end

  create_table "item_buyings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.float "price", limit: 24
    t.date "estimate_start_time"
    t.string "name"
    t.string "web_link"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_item_buyings_on_category_id"
    t.index ["status"], name: "index_item_buyings_on_status"
    t.index ["user_id"], name: "index_item_buyings_on_user_id"
  end

  create_table "months", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "value"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_months_on_user_id"
  end

  create_table "outcomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "month_id"
    t.integer "user_id"
    t.integer "category_id"
    t.string "name"
    t.float "value", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.index ["category_id"], name: "index_outcomes_on_category_id"
    t.index ["month_id"], name: "index_outcomes_on_month_id"
    t.index ["user_id"], name: "index_outcomes_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "value_by_months", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "item_buying_id"
    t.float "estimate_value", limit: 24
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_buying_id"], name: "index_value_by_months_on_item_buying_id"
  end

end
