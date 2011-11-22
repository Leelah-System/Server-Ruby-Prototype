class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name, :limit => 25, :null => false
      t.text :description
      t.string :siret
    end
  end

  def self.down
    drop_table :companies
  end
end
