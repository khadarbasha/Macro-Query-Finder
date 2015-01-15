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

ActiveRecord::Schema.define(:version => 20140103230157) do

  create_table "current_url_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scorecards", :force => true do |t|
    t.integer  "user_id"
    t.integer  "best_score", :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "top_scorers", :force => true do |t|
    t.string   "name"
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "hits",           :default => 0
    t.integer  "total_requests", :default => 0
  end

  create_table "url_lists", :force => true do |t|
    t.string   "name"
    t.boolean  "hit",        :default => false
    t.integer  "score",      :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
    t.string   "query"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                            :default => "",    :null => false
    t.string   "encrypted_password",                               :default => "",    :null => false
    t.integer  "phone_number",                        :limit => 8
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                    :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "challenge_complete",                               :default => false
    t.integer  "top_score",                                        :default => 0
    t.integer  "number_of_times_challenge_completed",              :default => 0
    t.boolean  "just_now_logged_in",                               :default => false
    t.boolean  "admin",                                            :default => false
    t.integer  "game_starting_time"
    t.integer  "game_ending_time"
    t.integer  "number_of_times_played",                           :default => 0
    t.integer  "notice",                                           :default => 0
    t.integer  "total_requests",                                   :default => 0
    t.boolean  "button_click",                                     :default => false
    t.boolean  "time_out",                                         :default => false
    t.boolean  "message_needed",                                   :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
