class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :iframe_action

  def after_sign_in_path_for(user)
  	admin_dashboard_path
  end

  def iframe_action
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://anchorprep.org"
  end
end
