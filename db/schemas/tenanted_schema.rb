# It's strongly recommended to check this file into your version control system.
    
Roomer::Schema.define(:version => 20110907150000) do

  create_table "addresses", :force => true do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "streeet3"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "type"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertiser_relationships", :force => true do |t|
    t.integer  "advertiser_id"
    t.integer  "company_id"
    t.integer  "separation"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "group_relationships", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owner_relationships", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenant_outlets", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
