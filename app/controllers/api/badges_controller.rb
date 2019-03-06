class Api::BadgesController < ApplicationController
	before_action :set_user

	def index
		render json: @user.badges.paginate(page: params[:page]).to_json
	end

  def create
    badge = @user.badges.create!
    badge.beginner! if @user.posts.size < 5
    badge.intermediate! if @user.posts.size > 5
    badge.advanced! if @user.posts.size > 10
    render json: { message: 'Badge Created',
      badge: badge
    }.to_json
  end

	def destroy
		badge = Badge.find(params[:id])
		badge.destroy!
		render json: {
			message: "successfully deleted"
		}.to_json
	end

	private

  def set_user
  	@user ||= User.find(params[:user_id])
  end

  def badges_params
  	params.require(:badge).permit(:badge_type)
  end
end