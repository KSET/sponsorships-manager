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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111009211606) do

  create_table "callers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "division"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "callers_events", :id => false, :force => true do |t|
    t.integer "caller_id"
    t.integer "event_id"
  end

  create_table "contributions", :force => true do |t|
    t.string   "status",     :limit => 1, :default => "N"
    t.decimal  "amount",                  :default => 0.0
    t.string   "other",                   :default => "Nothing"
    t.integer  "sponsor_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "events", :force => true do |t|
    t.integer  "year"
    t.integer  "event_type_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_sponsors", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "sponsor_id"
  end

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "adress"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
