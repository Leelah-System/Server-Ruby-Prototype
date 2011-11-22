class CreatePackageProductJoinTable < ActiveRecord::Migration
  def self.up
    create_table :packages_products, :id => false do |t|
      t.integer :package_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :packages_products
  end
end
