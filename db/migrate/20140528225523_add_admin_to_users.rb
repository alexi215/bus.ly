class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
