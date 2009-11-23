class Game < ActiveRecord::Base
	belongs_to :event
	belongs_to :team_away ,:class_name => "Team" , :foreign_key => "team_away_id"
	belongs_to :team_home ,:class_name => "Team" , :foreign_key => "team_home_id"
	
end
