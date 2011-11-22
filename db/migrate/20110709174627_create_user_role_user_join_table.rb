class CreateUserRoleUserJoinTable < ActiveRecord::Migration
  def self.up
    create_table :user_roles_users, :id => false do |t|
      t.integer :user_id
      t.integer :user_role_id
    end
  end

  def self.down
    drop_table :user_roles_users
  end
end
