class CreateBaskets < ActiveRecord::Migration
  def self.up
    create_table :baskets do |t|
      t.references :user, :null => false
      t.float :amount, :scale => 3

      t.timestamps
    end

    add_index :baskets, :user_id
  end

  def self.down
    drop_table :baskets
  end
end
