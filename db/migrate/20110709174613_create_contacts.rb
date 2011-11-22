class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.references :contactable, :polymorphic => true, :null => false
      t.string :email, :limit => 64
      t.string :telephone, :limit => 15
      t.string :mobile, :limit => 15
      t.string :website, :limit => 64
    end

    add_index :contacts, :contactable_id
  end

  def self.down
    drop_table :contacts
  end
end
