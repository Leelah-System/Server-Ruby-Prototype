class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.references :user, :null => false
      t.references :order_status, :null => false
      t.references :delivery_address
      t.string :reference, :null => false, :limit => 25
      t.float :amount, :scale => 3

      t.timestamps
    end

    add_index :orders, :user_id
    add_index :orders, :order_status_id
    add_index :orders, :delivery_address_id
  end

  def self.down
    drop_table :orders
  end
end
