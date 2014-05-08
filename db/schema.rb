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

ActiveRecord::Schema.define(version: 20140508211055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.integer "rank"
    t.string  "suit"
    t.integer "deck_id"
    t.string  "pic"
    t.integer "player_id"
  end

  create_table "dealers", force: true do |t|
    t.integer "table_id"
  end

  create_table "decks", force: true do |t|
    t.integer "dealer_id"
  end

  create_table "players", force: true do |t|
    t.integer "table_id"
    t.string  "name"
    t.integer "chips"
    t.integer "card_id"
  end

  create_table "tables", force: true do |t|
  end

end
