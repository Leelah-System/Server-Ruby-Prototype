class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.references :order, :null => false
      t.references :billing_address
      t.string :reference, :null => false, :limit => 25
      t.datetime :mailing_date

      t.timestamps
    end

    add_index :bills, :order_id
    add_index :bills, :billing_address_id
  end

  def self.down
    drop_table :bills
  end
end
