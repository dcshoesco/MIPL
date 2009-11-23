class CreateLeaguePosts < ActiveRecord::Migration
  def self.up
    create_table :league_posts do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :league_posts
  end
end
