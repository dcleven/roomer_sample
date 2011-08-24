# It's strongly recommended to check this file into your version control system.
    
Roomer::Schema.define(:version => 20110823204704) do

  create_table "owner_relationships", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
