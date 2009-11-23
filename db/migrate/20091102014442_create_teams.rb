class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.string :phone
      t.string :email
      t.integer :wins
      t.integer :loses

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
