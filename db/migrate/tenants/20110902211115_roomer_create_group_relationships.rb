class RoomerCreateGroupRelationships < ActiveRecord::Migration
  def self.up
    create_table(:group_relationships) do |t|
            t.string :name
            t.string :category
            t.integer :parent_id
            t.integer :child_id
        
      t.timestamps
    end
  end

  def self.down
    drop_table :group_relationships
  end
end
  