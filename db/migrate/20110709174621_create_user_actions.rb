class CreateUserActions < ActiveRecord::Migration
  def self.up
    create_table :user_actions do |t|
      t.string :label, :limit => 25, :null => false
      t.string :name, :limit => 25
      t.text :description
    end
  end

  def self.down
    drop_table :user_actions
  end
end
