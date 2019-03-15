class Api::PostsController < ApplicationController
	before_action :set_post, only: [:upvote, :downvote, :count_votes, :update]
	before_action :current_user, only: [:create, :upvote, :downvote, :update]
	
	def index
		render json: Post.paginate(page: params[:page]).to_json
	end

	def count_votes
		render json:{downvote: @post.get_downvotes.size,
			upvote: @post.get_upvotes.size}
	end

	def create
		post = current_user.posts.create!(post_params)
		render json: {
			status: 200,
			message: 'Post successfully created',
			post: post
			}.to_json
	end

	def update
		return @post.modify(params[:body]) if @post.id == current_user.id
		flash[:alert] = "You are not authorized to chnage this post"
	end


	def upvote
		@post.liked_by current_user
		render json:{ message: "upvote created"} 
	end

	def downvote
		@post.downvote_by current_user
		render json:{ message: "downvote created"} 
	end

	private
	
	def set_post
	  	@post = Post.find(params[:id])
    end

    def post_params
      	params.require(:post).permit(:title, :body)
	end

end