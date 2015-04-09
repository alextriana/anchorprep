class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def resources
  end

  def contact
  end

  def submit_contact_form
    @admins = Admin.all
    if User.exists?(email: params[:email]) == false
    	user = User.create!(email: params[:email], first_name: params[:first_name], last_name:params[:last_name], relationship: params[:relationship])
    else
    	user = User.where(email: params[:email])
    end
    @admins.each do |admin|
    	UserMailer.contact_alert(admin, user, params[:body]).deliver_now
    end
    UserMailer.contact_confirmation(user).deliver_now
      
    flash.keep
    flash[:notice] = "Your request has been submitted. You should recieve a confirmation email shortly."
    redirect_to contact_path
  end

  def signup
  end
end
