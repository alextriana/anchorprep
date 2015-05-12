class Event < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "400x600>"}, :default_url => "/images/logo.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
