class RoomerCreateAdvertiserRelationships < ActiveRecord::Migration
  def self.up
    create_table(:advertiser_relationships) do |t|
            t.integer :advertiser_id
            t.integer :company_id
            t.integer :separation
            t.string :contact
        
      t.timestamps
    end
  end

  def self.down
    drop_table :advertiser_relationships
  end
end
  