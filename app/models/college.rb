class College < ActiveRecord::Base
	has_attached_file :photo, :styles => { :preview => "300x450>", :main => "400x600>" }, :default_url => "/images/logo.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    	serialize :facts
end
