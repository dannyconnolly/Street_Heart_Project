class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      if current_user.admin?
        redirect_to admin_url, :notice => "You have logged in successfully"
      else
        redirect_to :controller => "users", :action => "your_profile", :notice => "You have logged in successfully"
      end
    else
      redirect_to login_url, :alert => "Invalid email/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "You have successfully logged out"
  end

end
