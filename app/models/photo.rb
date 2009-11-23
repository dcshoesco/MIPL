class Photo < ActiveRecord::Base
  has_attached_file	:file ,
						:styles => {:player => "265x180>",:small => "180x100>"},
						:path => ":rails_root/public/images/photo/:attachment/:category_:style.:extension",
						:url => "/images/photo/:attachment/:category_:style.:extension"
  CATEGORIES = {
    'general' => 'general',
    'event1' => 'event1',
    'event2' => 'event2',
    'event3' => 'event3',
    'event4' => 'event4',
    'event5' => 'event5'
  }
  validates_inclusion_of :category,:in => CATEGORIES.keys
end
