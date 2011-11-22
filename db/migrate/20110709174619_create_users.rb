class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name, :null => false, :limit => 25
      t.string :last_name, :null => false, :limit => 25
      t.string :email, :null => false, :limit => 64
      t.string :login, :null => false, :limit => 25
      t.string :password, :null => false, :limit => 255
      t.string :token, :null => false, :limit => 255
      t.string :salt, :null => false, :limit => 255
      t.integer :status, :default => 0
      t.string :reference_client, :limit => 25

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
