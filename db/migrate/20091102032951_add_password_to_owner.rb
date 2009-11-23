class AddPasswordToOwner < ActiveRecord::Migration
  def self.up
	remove_column :owners, :hash_password
    add_column :owners, :password, :string
  end

  def self.down
	add_column :owners , :hash_password, :string
    remove_column :owners, :password
  end
end
