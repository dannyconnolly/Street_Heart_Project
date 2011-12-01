class SessionsController < ApplicationController
	
	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			redirect_to products_path, :notice => "You have logged in successfully"
		else
			flash.now[:alert] = "Invalid login/password combination"
			render :action => 'new'
		end
	end
	
	def destroy
		reset_session
		redirect_to products_path, :notice => "You have successfully logged out"
	end
	
end
