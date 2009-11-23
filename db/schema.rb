# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091119142704) do

  create_table "events", :force => true do |t|
    t.datetime "date"
    t.string   "field"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "field_layout_file_name"
    t.string   "field_layout_content_type"
    t.integer  "field_layout_file_size"
    t.datetime "field_layout_updated_at"
  end

  create_table "games", :force => true do |t|
    t.string   "time"
    t.integer  "score_away"
    t.integer  "score_home"
    t.integer  "team_away_id"
    t.integer  "team_home_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "league_posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "owners", :force => true do |t|
    t.integer  "team_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "team_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "position"
  end

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "team_posts", :force => true do |t|
    t.integer  "team_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
