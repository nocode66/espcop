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

ActiveRecord::Schema.define(version: 20170414181621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.string   "string"
    t.string   "last_name"
    t.string   "title"
    t.text     "bio"
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "books_categories", id: false, force: :cascade do |t|
    t.integer "book_id"
    t.integer "category_id"
    t.index ["book_id"], name: "index_books_categories_on_book_id", using: :btree
    t.index ["category_id"], name: "index_books_categories_on_category_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "default"
    t.integer  "order"
  end

  create_table "content_items", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.integer  "status"
    t.boolean  "featured",           default: false
    t.boolean  "commentable",        default: false
    t.string   "menu_title"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "category_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "visible",            default: false
    t.string   "slug"
    t.integer  "order"
    t.boolean  "archived"
    t.index ["category_id"], name: "index_content_items_on_category_id", using: :btree
    t.index ["title"], name: "index_content_items_on_title", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.date     "date"
    t.text     "content"
    t.integer  "price",              default: 0
    t.boolean  "espcop",             default: false
    t.boolean  "registration",       default: false
    t.string   "url"
    t.boolean  "featured",           default: false
    t.integer  "featured_order",     default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "currency"
    t.text     "description"
  end

  create_table "newsletters", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.decimal  "amount",               precision: 8, scale: 2,                 null: false
    t.string   "interval",                                                     null: false
    t.string   "name",                                                         null: false
    t.string   "currency",                                     default: "usd", null: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.string   "stripe_id",                                                    null: false
    t.integer  "interval_count",                               default: 1,     null: false
    t.string   "statement_descriptor"
    t.integer  "trial_period_days",                            default: 0
    t.boolean  "visible",                                      default: false, null: false
    t.integer  "tokens",                                       default: 20,    null: false
  end

  create_table "tinymce_assets", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
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
    t.integer  "subscription_plan_id"
    t.string   "stripe_card_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "card_last4"
    t.string   "card_type"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["subscription_plan_id"], name: "index_users_on_subscription_plan_id", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "users", "subscription_plans"
end
