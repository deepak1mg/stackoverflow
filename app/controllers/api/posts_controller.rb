class Api::PostsController < ApplicationController
	before_action :set_user

	def index
		render json: Post.all.to_json
	end

	def create
		auth=Authdetail.find_by(auth_token: request.headers["Authorization"])
		cur_user=auth.user
		@post=cur_user.posts.build(page_params)
		if @post.save
			render json: {
				status: 200,
				message: 'Post successfully created',
				post: @post
			}.to_json
		else
			render json: {
				status: 501,
				message: 'Unable to create user'
			}
		end 
	end
	def destroy
		@post=Post.find(params[:id])
		@post.destroy
		render json: {
			message: "successfully deleted"
		}
	end

	def query
		@post=@current_user.posts.all
		query_array=Array.new
		@post.each do |query|
			query_array << query.title
		end
		render json:query_array.to_json
	end
	private

	  def set_user
	  	puts params
	  	@user=User.find_by(id: params[:user_id])
	  end

	  def page_params
	  	puts params
	  	params.permit(:title, :body, :tags)
	  end
end