class UpdateUserModel < ActiveRecord::Migration
  def change
  	add_column :users, :salt, :string
  	add_column :users, :encrypted_password, :string
  end
end
