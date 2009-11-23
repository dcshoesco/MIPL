class RemoveWinsToTeam < ActiveRecord::Migration
  def self.up
    remove_column :teams, :wins
    remove_column :teams, :loses
  end

  def self.down
    add_column :teams, :wins, :integer
    add_column :teams, :loses, :integer
  end
end
