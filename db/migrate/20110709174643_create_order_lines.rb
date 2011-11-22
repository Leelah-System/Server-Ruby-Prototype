class CreateOrderLines < ActiveRecord::Migration
  def self.up
    create_table :order_lines do |t|
      t.references :basket_or_order, :polymorphic => true, :null => false
      t.references :package_or_order, :polymorphic => true, :null => false
      t.float :quantity, :scale => 5
      t.float :amount, :scale => 3
      t.references :address_delivery

      t.timestamps
    end

    add_index :order_lines, :basket_or_order_id
    add_index :order_lines, :package_or_order_id
    add_index :order_lines, :address_delivery_id
  end

  def self.down
    drop_table :order_lines
  end
end
