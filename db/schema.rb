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

ActiveRecord::Schema.define(version: 0) do

  create_table "eligibility_states", id: false, force: :cascade do |t|
    t.integer "StateId", limit: 1,  null: false
    t.string  "Title",   limit: 30
  end

  create_table "eligibility_sub_states", id: false, force: :cascade do |t|
    t.integer "StateId",    limit: 1,  null: false
    t.integer "SubStateId", limit: 1,  null: false
    t.string  "Title",      limit: 30
  end

  create_table "enrollment", id: false, force: :cascade do |t|
    t.integer  "status",      limit: 1, default: 0
    t.integer  "projId",      limit: 2, default: 0, null: false
    t.integer  "subjId",      limit: 4,             null: false
    t.integer  "homeId",      limit: 4,             null: false
    t.datetime "startDate"
    t.integer  "RAId",        limit: 4, default: 0
    t.integer  "eligibility", limit: 1, default: 0, null: false
    t.integer  "secondary",   limit: 1, default: 0, null: false
    t.integer  "idx",         limit: 4, default: 0, null: false
  end

  create_table "enrollment_states", id: false, force: :cascade do |t|
    t.integer "stateId", limit: 1,  default: 0,     null: false
    t.string  "Name",    limit: 20
    t.boolean "Display", limit: 1,  default: false
  end

  create_table "project_list", id: false, force: :cascade do |t|
    t.integer "projectId",   limit: 2,  default: 0,  null: false
    t.string  "name",        limit: 15, default: "", null: false
    t.string  "description", limit: 50, default: "", null: false
    t.integer "mask",        limit: 2
    t.integer "active",      limit: 1,  default: 0
  end

end
