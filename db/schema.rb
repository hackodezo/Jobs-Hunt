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

ActiveRecord::Schema.define(version: 20161213081158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "uploads", force: :cascade do |t|
    t.string   "file"
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "uploads", ["uploadable_id", "uploadable_type"], name: "index_uploads_on_uploadable_id_and_uploadable_type", using: :btree

end
