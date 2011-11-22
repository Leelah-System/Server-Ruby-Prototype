class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.string :reference, :limit => 25, :null => false
      t.string :label, :limit => 25, :null => false
      t.string :name, :limit => 25
      t.float :price, :scale => 3, :null => false
      t.text :description
      t.references :category

      t.timestamps
    end

    add_index :packages, :category_id
  end

  def self.down
    drop_table :packages
  end
end
