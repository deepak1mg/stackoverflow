class Api::BadgesController < ApplicationController
	before_action :set_user

	def index
		render json: @user.badges.paginate(:page => params[:page]).to_json
	end

  def create
    badge = @user.badges.create!(page_params)
    render json: {
      status: 200,
      message: 'Badge Created',
      badge: badge
    }.to_json
  end

	def destroy
		badge = Badge.find(params[:id])
		badge.destroy
		render json: {
			message: "successfully deleted"
		}.to_json
	end

	private

  def set_user
  	@user ||= User.find(params[:user_id])
  end

  def page_params
  	params.require(:badge).permit(:badge_type)
  end
end