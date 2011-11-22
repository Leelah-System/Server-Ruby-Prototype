class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true, :null => false
      t.string :label, :limit => 25
      t.string :country, :limit => 25
      t.string :zip_code, :limit => 10
      t.string :city, :limit => 25
      t.string :street_number, :limit => 5
      t.string :street, :limit => 50
      t.text :additional_address
    end

    add_index :addresses, :addressable_id
  end

  def self.down
    drop_table :addresses
  end
end
