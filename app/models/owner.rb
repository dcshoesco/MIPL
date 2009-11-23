class Owner < ActiveRecord::Base
  validates_presence_of :firstname, :lastname,:password
  belongs_to :team
  def to_param
	id.to_s+'-'+firstname.downcase.gsub(' ', '_')+'-'+lastname.downcase.gsub(' ', '_')
  end
end
