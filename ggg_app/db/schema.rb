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

ActiveRecord::Schema.define(:version => 20141020083953) do

  create_table "matches", :force => true do |t|
    t.string   "div"
    t.date     "date"
    t.integer  "hometeam_id"
    t.integer  "awayteam_id"
    t.integer  "fthg"
    t.integer  "ftag"
    t.string   "ftr"
    t.integer  "hthg"
    t.integer  "htag"
    t.string   "htr"
    t.string   "referee"
    t.integer  "hs"
    t.integer  "as"
    t.integer  "hst"
    t.integer  "ast"
    t.integer  "hf"
    t.integer  "af"
    t.integer  "hc"
    t.integer  "ac"
    t.integer  "hy"
    t.integer  "ay"
    t.integer  "hr"
    t.integer  "ar"
    t.float    "b365h"
    t.float    "b365d"
    t.integer  "b365"
    t.float    "bwh"
    t.float    "bwd"
    t.integer  "bwa"
    t.float    "iwh"
    t.integer  "iwd"
    t.integer  "iwa"
    t.float    "lbh"
    t.integer  "lbd"
    t.integer  "lba"
    t.float    "psh"
    t.float    "psd"
    t.float    "psa"
    t.float    "whh"
    t.float    "whd"
    t.integer  "wha"
    t.float    "sjh"
    t.float    "sjd"
    t.integer  "sja"
    t.float    "vch"
    t.float    "vcd"
    t.float    "vca"
    t.integer  "bb1x2"
    t.float    "bbmxh"
    t.float    "bbavh"
    t.float    "bbmxd"
    t.float    "bbavd"
    t.integer  "bbmxa"
    t.float    "bbava"
    t.integer  "bbou"
    t.float    "bbmx25"
    t.float    "bbavgt25"
    t.float    "bbmxlt25"
    t.float    "bbavlt25"
    t.integer  "bbah"
    t.float    "bbahh"
    t.float    "bbmxahh"
    t.float    "bbavahh"
    t.float    "bbmxaha"
    t.float    "bbavaha"
    t.string   "season"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
