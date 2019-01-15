class SessionController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(username: session_params[:username])
    	if @user && @user.authenticate(session_params[:password])
    		login(@user)
    		redirect_to root_path
    	else
    		flash[:message] = "Can not find and/or authenticate user"
        redirect_to login_path
    	end
	end

	def destroy
		session.clear
		redirect_to root_path
	end

	private

	def session_params
		params.require(:user).permit(:username, :password)
	end


end