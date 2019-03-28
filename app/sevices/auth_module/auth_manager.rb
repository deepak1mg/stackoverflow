module AuthModule
	class AuthManager
		
		def login(user,pass)
			@user, @pass = user, pass
			return if user_login == false
			@auth = @user.authdetails.create!(auth_token: SecureRandom.uuid)
		end

		def hash_passkey(user)
			#@user=user
			user.password = password_hash(user.password, user.created_at)
			user.save
		end


		private

		def user_login
			return true if check_password 
			false
		end
		
		def check_password
			return false if @user.password.to_i != password_hash(@pass, @user.created_at).to_i
			true
		end

		def password_hash(password, created)
  			key = Rails.application.secrets.secret_key_base.to_i
  			pass = password.to_i
  			create_time = created.to_i
  			(key^pass^create_time).to_i
 		end
	end
end