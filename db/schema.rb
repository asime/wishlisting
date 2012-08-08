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

ActiveRecord::Schema.define(:version => 20120808222420) do

  create_table "charities", :force => true do |t|
    t.string   "charity_name"
    t.string   "contact_name"
    t.string   "email"
    t.string   "login"
    t.string   "password"
    t.text     "about"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "dts_url"
    t.string   "short_name"
  end

  create_table "donations", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.decimal  "amount"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.string   "email"
    t.string   "phone"
    t.boolean  "processed"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "charity_id"
    t.integer  "wishlist_item_id"
  end

  create_table "images", :force => true do |t|
    t.binary   "image"
    t.string   "description"
    t.boolean  "image_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "wishlist_item_id"
  end

  create_table "wepay_checkout_records", :force => true do |t|
    t.integer  "checkout_id"
    t.integer  "account_id"
    t.string   "state"
    t.string   "short_description"
    t.text     "long_description"
    t.string   "currency"
    t.decimal  "amount"
    t.decimal  "app_fee"
    t.string   "fee_payer"
    t.decimal  "gross"
    t.decimal  "fee"
    t.string   "reference_id"
    t.text     "redirect_uri"
    t.text     "callback_uri"
    t.text     "checkout_uri"
    t.string   "payer_email"
    t.string   "payer_name"
    t.text     "cancel_reason"
    t.text     "refund_reason"
    t.boolean  "auto_capture"
    t.boolean  "require_shipping"
    t.text     "shipping_address"
    t.decimal  "tax"
    t.string   "security_token"
    t.string   "access_token"
    t.string   "mode"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "wepay_checkout_records", ["checkout_id"], :name => "index_wepay_checkout_records_on_checkout_id"

  create_table "wishlist_items", :force => true do |t|
    t.string   "item"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "charity_id"
    t.integer  "image_id"
  end

end
