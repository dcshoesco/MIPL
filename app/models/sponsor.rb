class Sponsor < ActiveRecord::Base
  has_attached_file	:image ,
						:styles => {:small => "300x90>"},
						:path => ":rails_root/public/images/sponsors/:attachment/:name_:style.:extension",
						:url => "/images/sponsors/:attachment/:name_:style.:extension"
	validates_presence_of :name
	validates_presence_of :website
end
