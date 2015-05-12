class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @colleges = College.all
    @users = User.all
    @updates = Update.all
    @events = Event.all
  end
end
