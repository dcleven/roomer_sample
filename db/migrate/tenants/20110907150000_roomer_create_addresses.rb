class RoomerCreateAddresses < ActiveRecord::Migration
  def self.up
    create_table(:addresses) do |t|
      t.string :street1
      t.string :street2
      t.string :streeet3
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :type
      t.references :addressable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
  