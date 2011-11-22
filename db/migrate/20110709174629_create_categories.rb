class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.references :sup_category
      t.string :label, :limit => 25, :null => false
      t.string :name, :limit => 25
      t.text :description

      t.timestamps
    end

    add_index :categories, :sup_category_id
  end

  def self.down
    drop_table :categories
  end
end
