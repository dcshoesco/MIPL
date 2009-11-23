class LeaguePost < ActiveRecord::Base
  has_attached_file	:picture ,
 						:styles => {:large => "310x220>",:small => "118x115>"},
 						:path => ":rails_root/public/images/league_news/:attachment/:title_:style.:extension",
 						:url => "/images/league_news/:attachment/:title_:style.:extension"
 	validates_presence_of :title , :description
 	
 	def to_param
		id.to_s+'-'+title.downcase.gsub(' ', '_')
	end
end
