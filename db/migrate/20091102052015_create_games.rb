class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :time
      t.integer :score_away
      t.integer :score_home
      t.integer :team_away_id
      t.integer :team_home_id

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
