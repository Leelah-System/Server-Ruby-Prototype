class CreateUserHistories < ActiveRecord::Migration
  def self.up
    create_table :user_histories do |t|
      t.references :user, :null => false
      t.references :user_action, :null => false
      t.text :detail
      t.string :ip, :null => false, :limit => 15

      t.timestamps
    end

    add_index :user_histories, :user_id
    add_index :user_histories, :user_action_id
  end

  def self.down
    drop_table :user_histories
  end
end
