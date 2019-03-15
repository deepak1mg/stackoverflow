class Api::SessionsController < ApplicationController
	def new
	end
	
	def create
    	user = User.find_by_email(params[:email])
		if @auth = AuthModule::AuthManager.new.login(user, params[:password])
			cookies.permanent[:auth_token]=@auth.auth_token if params[:remember_me]
			cookies[:auth_token]=@auth.auth_token 
			#store_session_value
			#cookie_remember
			render json: {
				message: "Logged in ",
				user: user.email,
				session_id: cookies[:auth_token]
			}
		end
	end

	# def cookie_remember
	# 	@user.remember
	# 	cookies.permanent.signed[:user_id] = @auth.auth_token 
 	#   cookies.permanent[:remember_token] = user.remember_token
	# end

	def destroy
		cookies.delete(:auth_token)
    	#session[:user_id] = nil
    	@current_user = nil
		render json:{ message: "Successfully logged out"}.to_json
	end

	

	private
	def store_session_value
		session[:user_id] = @auth.auth_token 
		session[:expires_at] = 2.days.from_now
		@auth.active!
	end


end