class DashboardController < ApplicationController
  before_action :require_authentication
  
  def index
    @user_email = session[:user_email]
  end

  private

  def require_authentication
    redirect_to root_path, alert: 'Please log in to access the dashboard' unless session[:authenticated]
  end
end
