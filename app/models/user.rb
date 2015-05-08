class User < ActiveRecord::Base

	def self.add_or_update(permitted_params)
		email = permitted_params[:email]
		if User.exists?(email: email) == false
  			@user = User.create!(permitted_params)
  		else
  			@user = User.where(email: email)[0]
  			# puts permitted_params
  			@user.update(permitted_params)
  		end
  		@user
	end

	def send_contact_confirmation
		UserMailer.contact_confirmation(self).deliver_now
	end
end
