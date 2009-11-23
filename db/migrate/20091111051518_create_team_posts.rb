class CreateTeamPosts < ActiveRecord::Migration
  def self.up
    create_table :team_posts do |t|
      t.integer :team_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :team_posts
  end
end
