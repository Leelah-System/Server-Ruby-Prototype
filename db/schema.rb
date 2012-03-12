# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to save the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110709174651) do

  create_table "addresses", :force => true do |t|
    t.integer "addressable_id",                   :null => false
    t.string  "addressable_type",                 :null => false
    t.string  "label",              :limit => 25
    t.string  "country",            :limit => 25
    t.string  "zip_code",           :limit => 10
    t.string  "city",               :limit => 25
    t.string  "street_number",      :limit => 5
    t.string  "street",             :limit => 50
    t.text    "additional_address"
  end

  add_index "addresses", ["addressable_id"], :name => "index_addresses_on_addressable_id"

  create_table "baskets", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "baskets", ["user_id"], :name => "index_baskets_on_user_id"

  create_table "bills", :force => true do |t|
    t.integer  "order_id",                         :null => false
    t.integer  "billing_address_id"
    t.string   "reference",          :limit => 25, :null => false
    t.datetime "mailing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bills", ["billing_address_id"], :name => "index_bills_on_billing_address_id"
  add_index "bills", ["order_id"], :name => "index_bills_on_order_id"

  create_table "categories", :force => true do |t|
    t.integer  "sup_category_id"
    t.string   "label",           :limit => 25, :null => false
    t.string   "name",            :limit => 25
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["sup_category_id"], :name => "index_categories_on_sup_category_id"

  create_table "companies", :force => true do |t|
    t.string "name",        :limit => 25, :null => false
    t.text   "description"
    t.string "siret"
  end

  create_table "contacts", :force => true do |t|
    t.integer "contactable_id",                 :null => false
    t.string  "contactable_type",               :null => false
    t.string  "email",            :limit => 64
    t.string  "telephone",        :limit => 15
    t.string  "mobile",           :limit => 15
    t.string  "website",          :limit => 64
  end

  add_index "contacts", ["contactable_id"], :name => "index_contacts_on_contactable_id"

  create_table "order_actions", :force => true do |t|
    t.string "label",       :limit => 25, :null => false
    t.string "name",        :limit => 25
    t.text   "description"
  end

  create_table "order_histories", :force => true do |t|
    t.integer  "order_id",        :null => false
    t.integer  "order_action_id", :null => false
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_histories", ["order_action_id"], :name => "index_order_histories_on_order_action_id"
  add_index "order_histories", ["order_id"], :name => "index_order_histories_on_order_id"

  create_table "order_lines", :force => true do |t|
    t.integer  "basket_or_order_id",    :null => false
    t.string   "basket_or_order_type",  :null => false
    t.integer  "package_or_product_id",   :null => false
    t.string   "package_or_product_type", :null => false
    t.float    "quantity"
    t.float    "amount"
    t.integer  "address_delivery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_lines", ["address_delivery_id"], :name => "index_order_lines_on_address_delivery_id"
  add_index "order_lines", ["basket_or_order_id"], :name => "index_order_lines_on_basket_or_order_id"
  add_index "order_lines", ["package_or_product_id"], :name => "index_order_lines_on_package_or_product_id"

  create_table "order_statuses", :force => true do |t|
    t.string "label",       :limit => 25, :null => false
    t.string "name",        :limit => 25
    t.text   "description"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id",                           :null => false
    t.integer  "order_status_id",                   :null => false
    t.integer  "delivery_address_id"
    t.string   "reference",           :limit => 25, :null => false
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["delivery_address_id"], :name => "index_orders_on_delivery_address_id"
  add_index "orders", ["order_status_id"], :name => "index_orders_on_order_status_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "packages", :force => true do |t|
    t.string   "reference",   :limit => 25, :null => false
    t.string   "label",       :limit => 25, :null => false
    t.string   "name",        :limit => 25
    t.float    "price",                     :null => false
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "packages", ["category_id"], :name => "index_packages_on_category_id"

  create_table "packages_products", :id => false, :force => true do |t|
    t.integer "package_id"
    t.integer "product_id"
  end

  create_table "pictures", :force => true do |t|
    t.integer  "imageable_id",                 :null => false
    t.string   "imageable_type",               :null => false
    t.string   "path",                         :null => false
    t.string   "label",          :limit => 25
    t.string   "name",           :limit => 25
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["imageable_id"], :name => "index_pictures_on_imageable_id"

  create_table "products", :force => true do |t|
    t.string   "reference",   :limit => 25, :null => false
    t.string   "label",       :limit => 25, :null => false
    t.string   "name",        :limit => 25
    t.float    "price",                     :null => false
    t.text     "description"
    t.float    "stocks",                    :null => false
    t.integer  "supplier_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"
  add_index "products", ["supplier_id"], :name => "index_products_on_supplier_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name",        :limit => 25, :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_actions", :force => true do |t|
    t.string "label",       :limit => 25, :null => false
    t.string "name",        :limit => 25
    t.text   "description"
  end

  create_table "user_histories", :force => true do |t|
    t.integer  "user_id",                      :null => false
    t.integer  "user_action_id",               :null => false
    t.text     "detail"
    t.string   "ip",             :limit => 15, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_histories", ["user_action_id"], :name => "index_user_histories_on_user_action_id"
  add_index "user_histories", ["user_id"], :name => "index_user_histories_on_user_id"

  create_table "user_roles", :force => true do |t|
    t.string "label",       :limit => 25, :null => false
    t.string "name",        :limit => 25
    t.text   "description"
  end

  create_table "user_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "user_role_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",       :limit => 25,                :null => false
    t.string   "last_name",        :limit => 25,                :null => false
    t.string   "email",            :limit => 64,                :null => false
    t.string   "login",            :limit => 25,                :null => false
    t.string   "password",                                      :null => false
    t.string   "token",                                         :null => false
    t.string   "salt",                                          :null => false
    t.integer  "status",                         :default => 0
    t.string   "reference_client", :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
