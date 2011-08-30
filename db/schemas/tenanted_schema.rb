# It's strongly recommended to check this file into your version control system.
    
Roomer::Schema.define(:version => 20110825173810) do

  create_table "advertiser_relationships", :force => true do |t|
    t.integer  "advertiser_id"
    t.integer  "company_id"
    t.integer  "separation"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owner_relationships", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
