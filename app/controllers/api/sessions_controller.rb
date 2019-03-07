class Api::SessionsController < ApplicationController
	def new
	end
	
	def create
    	user = User.find_by_email(params[:email])
		if @auth = AuthModule::AuthManager.new.login(user, params[:password])
			store_session_value
			render json: {
				message: "Logged in ",
				user: user.email,
				session_id: session[:user_id]
			}
		end
	end

	def destroy
    	session[:user_id] = nil
		render json:{ message: "Successfully logged out"}.to_json
	end

	private
	def store_session_value
		session[:user_id] = @auth.auth_token 
		session[:expires_at] = 2.days.from_now
		@auth.active!
	end
end