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

ActiveRecord::Schema.define(version: 2019_07_30_155620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applauses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "idea_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_applauses_on_idea_id"
    t.index ["user_id", "idea_id"], name: "index_applauses_on_user_id_and_idea_id", unique: true
    t.index ["user_id"], name: "index_applauses_on_user_id"
  end

  create_table "idea_developers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "idea_id"
    t.boolean "develop", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_idea_developers_on_idea_id"
    t.index ["user_id"], name: "index_idea_developers_on_user_id"
  end

  create_table "idea_developpers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "idea_id"
    t.boolean "develop", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_idea_developpers_on_idea_id"
    t.index ["user_id"], name: "index_idea_developpers_on_user_id"
  end

  create_table "idea_reactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "idea_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_idea_reactions_on_idea_id"
    t.index ["user_id"], name: "index_idea_reactions_on_user_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "state"
    t.string "tag"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.text "uid"
    t.string "oauth_token"
    t.string "icon"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "applauses", "ideas"
  add_foreign_key "applauses", "users"
  add_foreign_key "idea_developers", "ideas"
  add_foreign_key "idea_developers", "users"
  add_foreign_key "idea_developpers", "ideas"
  add_foreign_key "idea_developpers", "users"
  add_foreign_key "idea_reactions", "ideas"
  add_foreign_key "idea_reactions", "users"
  add_foreign_key "ideas", "users"
end
