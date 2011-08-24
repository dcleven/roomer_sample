class RoomerCreateOwnerRelationshsips < ActiveRecord::Migration
  def self.up
    create_table(:owner_relationshsips) do |t|
            t.integer :owner_id
            t.integer :company_id
        
      t.timestamps
    end
  end

  def self.down
    drop_table :owner_relationshsips
  end
end
  