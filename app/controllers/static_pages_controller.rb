class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end

  def about
  end

  def resources
  end

  def contact
  end

  def services
  end

  def submit_contact_form
    permitted_params = params.permit(:email, :first_name, :last_name, :graduation, :relationship)
    @user = User.add_or_update(permitted_params)
    if @user.email.length > 0
      @user.send_contact_confirmation
    end
    Admin.alert_of_contact_request(@user, params[:body])
    flash[:notice] = "Your request has been submitted. You should recieve a confirmation email shortly."
    redirect_to contact_path
  end

end
