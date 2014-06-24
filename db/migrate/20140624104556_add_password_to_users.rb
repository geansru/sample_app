class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string, length: 40
  end
end
