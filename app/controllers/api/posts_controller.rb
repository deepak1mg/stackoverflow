class Api::PostsController < ApplicationController
	before_action :set_user

	def index
		render json: Post.paginate(page: params[:page], per_page: 10).to_json
	end

	def create
		cur_user = auth.user
		post = cur_user.posts.create!(page_params)
		render json: {
			status: 200,
			message: 'Post successfully created',
			post: post
			}.to_json
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		render json: {
			message: "successfully deleted"
		}
	end

	private

	  def set_user
	  	@user = User.find_by(id: params[:user_id])
	  end

	  def page_params
      	params.require(:post).permit(:title, :body, :tags)
	  end
end