class Player < ActiveRecord::Base
	has_attached_file	:picture ,
						:styles => {:small => "60x60"},
						:path => ":rails_root/public/images/players/:attachment/:name_:style.:extension",
						:url => "/images/players/:attachment/:name_:style.:extension"
	validates_presence_of :firstname,:lastname
	validates_numericality_of :number
	belongs_to :team
	
	def name
		firstname + "_" + lastname
	end
end
