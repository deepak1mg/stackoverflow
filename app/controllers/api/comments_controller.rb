class Api::CommentsController < ApplicationController
	before_action :set_post, only: [:comment_for_post,:post_comments]
	before_action :set_answer, only: [:comment_for_answer, :answers_comments]
	before_action :current_user, only: [:comment_for_answer, :comment_for_post]

	# def index
	# 	debugger
	# 	render json: @post.comments.paginate(page: params[:page], per_page: 10).to_json if params[:id]
	# 	render json: @answer.comments.paginate(page: params[:page], per_page: 10).to_json if params[:id]
	# end

	def post_comments
		render json: @post.comments.paginate(page: params[:page], per_page: 10).to_json
	end

	def answers_comments
		render json: @answer.comments.paginate(page: params[:page], per_page: 10).to_json
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
		@answer = Answer.find(params[:id])
	end

end