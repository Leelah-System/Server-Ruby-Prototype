class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name, :limit => 25, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
