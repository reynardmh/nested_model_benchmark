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

ActiveRecord::Schema.define(version: 20150908141855) do

  create_table "ancestry_models", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "ancestry",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "ancestry_models", ["ancestry"], name: "ancestry_models_ancestry_idx", using: :btree

  create_table "closure_tree_model_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   limit: 4, null: false
    t.integer "descendant_id", limit: 4, null: false
    t.integer "generations",   limit: 4, null: false
  end

  add_index "closure_tree_model_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "closure_tree_model_anc_desc_idx", unique: true, using: :btree
  add_index "closure_tree_model_hierarchies", ["descendant_id"], name: "closure_tree_model_desc_idx", using: :btree

  create_table "closure_tree_models", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "closure_tree_models", ["parent_id"], name: "closure_tree_models_parent_idx", using: :btree

end
