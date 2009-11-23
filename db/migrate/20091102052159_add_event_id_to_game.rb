class AddEventIdToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :event_id, :integer
  end

  def self.down
    remove_column :games, :event_id
  end
end
