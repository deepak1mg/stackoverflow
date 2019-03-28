class Api::PasswordResetsController < ApplicationController
	def create
		user = User.find_by_email!(params[:email])
		user.authdetails.create!(auth_token: SecureRandom.uuid, sent_at: Time.now)
		UserMailer.reset_password(user).deliver
		render plain: "http://localhost:3000/api/password_resets/#{user.authdetails.last.auth_token}"
	end

	def update
		auth = Authdetail.find_by_auth_token(params[:id])
		user = auth.user
		true if auth.sent_at < Time.now 
			user.update_attribute(:password, params[:password])
			AuthModule::AuthManager.new.hash_passkey(user)
			render json: {
				message: 'password set'
			}

	end
end
