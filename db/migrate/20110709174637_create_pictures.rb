class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.references :imageable, :polymorphic => true, :null => false
      t.string :path, :limit => 255, :null => false
      t.string :label, :limit => 25
      t.string :name, :limit => 25
      t.text :description

      t.timestamps
    end

    add_index :pictures, :imageable_id
  end

  def self.down
    drop_table :pictures
  end
end
