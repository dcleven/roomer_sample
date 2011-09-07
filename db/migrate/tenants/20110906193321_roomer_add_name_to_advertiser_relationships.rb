class RoomerAddNameToAdvertiserRelationships < ActiveRecord::Migration
  def self.up
    add_column :advertiser_relationships, :name, :string
  end

  def self.down
    remove_column :advertiser_relationships, :name
  end
end
