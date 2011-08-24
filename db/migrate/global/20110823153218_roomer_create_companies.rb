class RoomerCreateCompanies < ActiveRecord::Migration
  def self.up
    create_table(:companies) do |t|
            t.string :name
            t.string :type
        
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
  