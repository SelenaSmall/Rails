class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
  end

  def self.down
      remove_column :users, :role
  end
end
