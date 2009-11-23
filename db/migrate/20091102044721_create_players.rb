class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :team_id
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
