class SessionsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :authenticate

  def new
  end

  # @reference Agile web development with rails book
  def create
    if user = User.authenticate(params[:email], params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      if admin?
        redirect_to admin_url, :notice => "You have logged in successfully"
      else
        redirect_to :controller => "users", :action => "your_profile", :notice => "You have logged in successfully"
      end
    else
      redirect_to login_path, :alert => "Invalid email/password combination"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path, :notice => "You have successfully logged out"
  end

end
