class CreateOwners < ActiveRecord::Migration
  def self.up
    create_table :owners do |t|
      t.integer :team_id
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :username
      t.string :hash_password
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :owners
  end
end
