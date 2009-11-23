class Event < ActiveRecord::Base
	has_attached_file	:field_layout ,
						:styles => {:small => "100x100"},
						:path => ":rails_root/public/images/events/:attachment/:name_:style.:extension",
						:url => "/images/events/:attachment/:name_:style.:extension"
						
	validates_presence_of :date,:field
	has_many :games, :dependent => :destroy
	def name
		field + '_' + date.strftime("%Y%m%d")
    end
end
