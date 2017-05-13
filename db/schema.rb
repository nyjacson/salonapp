# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170513232925) do

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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "articles", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "article",    null: false
    t.string   "category"
    t.string   "picthum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["title"], name: "index_articles_on_title"

  create_table "shopbranches", force: :cascade do |t|
    t.string   "shopinfo_id", null: false
    t.string   "shopname",    null: false
    t.string   "branchname",  null: false
    t.string   "address"
    t.integer  "tel"
    t.string   "starthour"
    t.string   "endhour"
    t.string   "e_starthour"
    t.string   "e_endhour"
    t.string   "holiday"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "train"
    t.string   "station"
    t.string   "train2"
    t.string   "station2"
    t.string   "train3"
    t.string   "station3"
    t.string   "area"
    t.string   "prefec"
    t.string   "city"
    t.text     "access"
    t.string   "sheet"
    t.text     "info"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shopbranches", ["branchname"], name: "index_shopbranches_on_branchname"
  add_index "shopbranches", ["shopinfo_id"], name: "index_shopbranches_on_shopinfo_id"
  add_index "shopbranches", ["station"], name: "index_shopbranches_on_station"

  create_table "shopfbs", force: :cascade do |t|
    t.string   "shopinfo_id", null: false
    t.string   "fbshopname"
    t.string   "fbtitle",     null: false
    t.text     "fbcomment",   null: false
    t.string   "auther"
    t.integer  "fbrank",      null: false
    t.string   "ages",        null: false
    t.string   "jobs"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shopfbs", ["shopinfo_id"], name: "index_shopfbs_on_shopinfo_id"

  create_table "shopinfos", force: :cascade do |t|
    t.string   "shopname",   null: false
    t.text     "company"
    t.string   "affili",     null: false
    t.integer  "ranking"
    t.text     "recommend"
    t.string   "shoptype",   null: false
    t.string   "treattype"
    t.string   "body"
    t.string   "machine"
    t.text     "campaign"
    t.string   "price1"
    t.string   "price2"
    t.string   "price3"
    t.string   "pic1"
    t.string   "pic2"
    t.string   "pic3"
    t.string   "pic4"
    t.string   "pic5"
    t.text     "recommend2"
    t.text     "recommend3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shopinfos", ["shopname"], name: "index_shopinfos_on_shopname", unique: true

end
