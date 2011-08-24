# It's strongly recommended to check this file into your version control system.
    
Roomer::Schema.define(:version => 20110823153218) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", :force => true do |t|
    t.string   "url_identifier"
    t.string   "schema_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tenants", ["schema_name"], :name => "schema_name", :unique => true
  add_index "tenants", ["url_identifier"], :name => "url_identifier", :unique => true

end
