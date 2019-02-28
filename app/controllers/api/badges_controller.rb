class Api::BadgesController < ApplicationController
	before_action :set_user

	def index
		render json: @user.badges.all.to_json
	end

	def create
		@badge=@user.badges.build(page_params)
		if @badge.save
			render json: {
				status: 200,
				message: 'Badge created',
				user: @badge
			}.to_json
		else
			render json: {
				status: 501,
				message: 'Unable to create badge'
			}
		end 
	end

	def destroy
		@badge=Badge.find(params[:id])
		@badge.destroy
		render json: {
			message: "successfully deleted"
		}
	end
	private

	  def set_user
	  	puts params
	  	@user=User.find_by(id: params[:user_id])
	  end

	  def page_params
	  	puts params
	  	params.permit(:badgetype)
	  end
end