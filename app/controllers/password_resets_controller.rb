class PasswordResetsController < ApplicationController
  skip_before_filter :authorize
   skip_before_filter :authenticate
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to login_url, :notice => "An E-mail has been sent to with password reset instructions."
  end

end
