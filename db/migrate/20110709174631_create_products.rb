class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :reference, :limit => 25, :null => false
      t.string :label, :limit => 25, :null => false
      t.string :name, :limit => 25
      t.float :price, :scale => 3, :null => false
      t.text :description
      t.float :stocks, :scale => 5, :null => false
      t.references :supplier
      t.references :category

      t.timestamps
    end

    add_index :products, :supplier_id
    add_index :products, :category_id
  end

  def self.down
    drop_table :products
  end
end
