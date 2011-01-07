class AccessController < ApplicationController

  before_filter :confirm_logged_in, :only => [:index, :menu]
  
  def index
    menu
    render('menu')
  end
  
  def menu
  end

  def login
  end
  
  def logout
    session[:user_id] = nil
    session[:user_username] = nil
    flash[:notice] = "Logged out."
    redirect_to :action => 'login'
  end

  def attempt_login
    authorized_user = User.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:user_username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end
  
end
