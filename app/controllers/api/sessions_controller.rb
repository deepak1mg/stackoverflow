class Api::SessionsController < ApplicationController
	def new
	end
	
	def create
    	user = User.find_by(email: params[:email])
		if user && user.password.to_i == password_hash(params[:password], user.created_at)
			auth = user.authdetails.create!(auth_token: SecureRandom.uuid)
			session[:user_id] = auth.auth_token 
			render json: {
				message: "Logged in ",
				user: user.email,
				session_id: session[:user_id]
			}
		else
			render json: {
				message: "Invalid credentials"
			}
		end
	end

	def destroy
    session[:user_id] = nil
		render json:{
				message: "Successfully logged out"}.to_json
	end

end