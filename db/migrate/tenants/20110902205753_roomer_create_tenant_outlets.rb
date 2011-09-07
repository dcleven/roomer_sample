class RoomerCreateTenantOutlets < ActiveRecord::Migration
  def self.up
    create_table(:tenant_outlets) do |t|
            t.string :name
            t.integer :company_id
            t.string :type
        
      t.timestamps
    end
  end

  def self.down
    drop_table :tenant_outlets
  end
end
  