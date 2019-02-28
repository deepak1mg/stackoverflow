class Api::SessionsController < ApplicationController
	def new
	end
	def create
		@user=User.find_by(email: params[:email])
		if @user && @user.password.to_i==my_hash(params[:password],@user.created_at)
			auth=@user.authdetails.new
			auth.auth_token=session[:user_id]=SecureRandom.uuid
			auth.save
			render json: {
				message: "Logged in ",
				user: @user.email,
				session_id: session[:user_id],
				auth: auth
			}
		else
			render json: {
				message: "Invalid credentials"
			}
		end
	end

	def destroy
		if session[:user_id]==nil
			render json:{
					message: "you are already logged out"
				}.to_json
		else
    		session[:user_id]=nil
			render json:{
					message: "Successfully logged out"
				}.to_json

		end
	end
	def auth_params
		params.permit(:auth_token)
	end
end