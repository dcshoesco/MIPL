class Team < ActiveRecord::Base
	has_attached_file	:picture ,
						:styles => {:small => "80x80>",:medium => "200x200>",:tiny => "25x25>"},
						:path => ":rails_root/public/images/teams/:attachment/:name_:style.:extension",
						:url => "/images/teams/:attachment/:name_:style.:extension"
						
	validates_presence_of :name
	has_one :owner, :dependent => :destroy
	has_many :players, :dependent => :destroy
	has_many :team_posts,:order => 'created_at DESC', :dependent => :destroy
	accepts_nested_attributes_for :owner
	
	def to_param
		id.to_s+'-'+name.downcase.gsub(' ', '_')
	end
	
	def total
    wins * 2
  end
  
  def wins
    Game.count(:conditions => ['(team_home_id = ? AND score_home = 5) OR (team_away_id = ? AND score_away = 5)',id,id])
  end
  
  def loses
    Game.count(:conditions => ['(team_home_id = ? AND (score_home < 5 AND score_home > 0)) OR (team_away_id = ? AND (score_away < 5 AND score_away > 0))',id,id])
  end
  
  def allowed
    Game.sum(:score_away,:conditions => ['team_home_id = ?',id]) + Game.sum(:score_home,:conditions => ['team_away_id = ?',id])
  end
  
  def score
    Game.sum(:score_away,:conditions => ['team_away_id = ?',id]) + Game.sum(:score_home,:conditions => ['team_home_id = ?',id])
  end
end
