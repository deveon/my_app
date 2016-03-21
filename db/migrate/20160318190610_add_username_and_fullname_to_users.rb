class AddUsernameAndFullnameToUsers < ActiveRecord::Migration
  def change
   add_column :users, :username, :string, :unique => true
   add_column :users, :fullname, :string
  end
end
