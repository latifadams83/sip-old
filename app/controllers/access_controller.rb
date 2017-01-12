class AccessController < ApplicationController

  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout]

  def menu
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Login successful"
      redirect_to admin_staffs_path
    else
      flash.now[:notice] = "Invalid email or password"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You are logged out"
    redirect_to access_login_path
  end

  private
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please Login"
      redirect_to access_login_path
    end
  end
end
