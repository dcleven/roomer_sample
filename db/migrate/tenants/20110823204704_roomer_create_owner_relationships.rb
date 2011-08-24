class RoomerCreateOwnerRelationships < ActiveRecord::Migration
  def self.up
    create_table(:owner_relationships) do |t|
      t.integer :owner_id
      t.integer :company_id
      t.timestamps
    end
  end

  def self.down
    drop_table :owner_relationships
  end
end
