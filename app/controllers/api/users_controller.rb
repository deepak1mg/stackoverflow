class Api::UsersController < ApplicationController

	def index
		render json:User.all
	end

	def create
		@user=User.new(page_params)
		@user.save
		@user.password=my_hash(@user.password,@user.created_at)
		@user.expiry_time=10.days.from_now
		@user.save
		render json: {
			user:@user
		}
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		render json: {
			message: "successfully deleted"
		}
	end

	private

	  def page_params
	  	puts "+++++++++"
		puts params
	  	params.permit(:name, :email, :password,:expiry_time)
	  end
end
