class TeamPost < ActiveRecord::Base
  belongs_to :team
  has_attached_file	:picture ,
 						:styles => {:large => "310x220>",:small => "60x60>"},
 						:path => ":rails_root/public/images/team_posts/:attachment/:title_:style.:extension",
 						:url => "/images/team_posts/:attachment/:title_:style.:extension"
 	validates_presence_of :title , :description
 	
 	def to_param
		id.to_s+'-'+title.downcase.gsub(' ', '_')
	end
end
