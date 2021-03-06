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

ActiveRecord::Schema.define(:version => 20120917130917) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "page_id"
    t.boolean  "active",        :default => true
    t.date     "start_date"
    t.string   "site_url"
    t.string   "donate_url"
    t.string   "contact_email"
    t.string   "info_url"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "countries", ["code"], :name => "index_countries_on_code", :unique => true
  add_index "countries", ["name"], :name => "index_countries_on_name", :unique => true

  create_table "country_initiatives", :force => true do |t|
    t.integer  "country_id"
    t.string   "country_url"
    t.integer  "initiative_id"
    t.string   "initiative_url"
    t.date     "join_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "country_initiatives", ["country_id", "initiative_id"], :name => "index_country_initiatives_on_country_id_and_initiative_id", :unique => true

  create_table "initiatives", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.integer  "page_id"
    t.string   "site_url"
    t.string   "donate_url"
    t.string   "contact_email"
    t.string   "abbreviation"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "initiatives", ["abbreviation"], :name => "index_initiatives_on_abbreviation", :unique => true
  add_index "initiatives", ["name"], :name => "index_initiatives_on_name", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "html",       :default => "<p>No content.</p>"
    t.integer  "country_id"
    t.integer  "locked_by"
    t.datetime "locked_at"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "pages", ["title", "country_id"], :name => "index_pages_on_title_and_country_id", :unique => true
  add_index "pages", ["title"], :name => "index_pages_on_title"

  create_table "references", :force => true do |t|
    t.string   "link_text"
    t.integer  "link_target_id"
    t.string   "link_target_type"
    t.integer  "link_source_id"
    t.string   "link_source_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "revisions", :force => true do |t|
    t.integer  "author_id"
    t.text     "content"
    t.text     "html"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "verified_at"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "valid_emails", :force => true do |t|
    t.string   "email"
    t.datetime "checked_in_at"
    t.datetime "expires_at"
    t.string   "permissions",   :default => "volunteer"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

end
