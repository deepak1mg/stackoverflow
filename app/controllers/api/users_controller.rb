class Api::UsersController < ApplicationController

	def index
		render json: User.paginate(page: params[:page], per_page: 5).to_json 
 		
	end

	def create
		user = User.create!(page_params)
		user.password = password_hash(user.password, user.created_at)
	  user.expiry_time = 10.days.from_now
		user.save
		render plain: "User created"
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		render plain: "Successfully deleted"
	end

	private

	  def page_params
	  	params.require(:user).permit(:name, :email, :password,:expiry_time)
	  end
end
