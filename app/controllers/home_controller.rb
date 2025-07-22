class HomeController < ApplicationController
  def index
    redirect_to dashboard_path if session[:authenticated]
  end

  def authenticate
    email = params[:email]
    password = params[:password]

    if email.present? && password.present?
      session[:authenticated] = true
      session[:user_email] = email
      redirect_to dashboard_path, notice: 'Successfully authenticated!'
    else
      redirect_to root_path, alert: 'Please provide both email and password'
    end
  end

  def logout
    session.delete(:authenticated)
    session.delete(:user_email)
    redirect_to root_path, notice: 'Successfully logged out!'
  end
end
