class CreateOrderHistories < ActiveRecord::Migration
  def self.up
    create_table :order_histories do |t|
      t.references :order, :null => false
      t.references :order_action, :null => false
      t.text :detail

      t.timestamps
    end

    add_index :order_histories, :order_id
    add_index :order_histories, :order_action_id
  end

  def self.down
    drop_table :order_histories
  end
end
