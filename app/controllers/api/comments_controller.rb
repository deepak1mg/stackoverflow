class Api::CommentsController < ApplicationController
	before_action :set_post, only: [:comment_for_post]
	before_action :set_answer, only: [:comment_for_answer]
	before_action :current_user, only: [:comment_for_answer, :comment_for_post]

	def index
		render json: Answer.comments.paginate(page: params[:page], per_page: 10).to_json if params[:id]
		render json: Post.comments.paginate(page: params[:page], per_page: 10).to_json if params[:id]
	end

	def comment_for_post
		comment = @post.comments.create!(body: params[:body], user_id: current_user.id)
		render json: {
			message: 'Comment created'
		}
	end

	def comment_for_answer
		comment = @answer.comments.create!(body: params[:body], user_id: current_user.id)
		render json: {
			message: 'Comment created'
		}
	end



	private
	
	def set_post
		@post = Post.find(params[:id])

	end

	def set_answer
		@post = Answer.find(params[:id])
	end

end