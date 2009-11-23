class AddAttachmentsPictureToLeaguePost < ActiveRecord::Migration
  def self.up
    add_column :league_posts, :picture_file_name, :string
    add_column :league_posts, :picture_content_type, :string
    add_column :league_posts, :picture_file_size, :integer
    add_column :league_posts, :picture_updated_at, :datetime
  end

  def self.down
    remove_column :league_posts, :picture_file_name
    remove_column :league_posts, :picture_content_type
    remove_column :league_posts, :picture_file_size
    remove_column :league_posts, :picture_updated_at
  end
end
