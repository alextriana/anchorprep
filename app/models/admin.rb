class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.alert_of_contact_request(user, body)
  	# @admins = Admin.all
  	# @admins.each do |admin|
   #  	UserMailer.contact_alert(admin, user, body).deliver_now
   #  end
   UserMailer.contact_alert(Admin.last, user, body).deliver_now
  end
end
