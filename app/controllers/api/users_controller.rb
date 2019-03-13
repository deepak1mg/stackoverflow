class Api::UsersController < ApplicationController

	def index
		render json: User.paginate(page: params[:page]).to_json 
	end

	def create
		user = User.create!(users_params)
		AuthModule::AuthManager.new.hash_passkey(user)
		#AuthModule::AuthManager.new.login(user, params[:password])
		render json:{ message: "User created"}
	end

	def destroy
		user = User.find(params[:id])
		user.destroy!
		render json:{ message: "Successfully deleted"}
	end

	private

	  def users_params
	  	params.require(:user).permit(:name, :email, :password)
	  end
end