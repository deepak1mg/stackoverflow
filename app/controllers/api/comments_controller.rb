class Api::CommentsController < ApplicationController
	before_action :load_commentable
	before_action :current_user, only: [:create]

	def index
		render json: @commentable.comments.paginate(page: params[:page], per_page: 10).to_json
	end

	def create
		comment = @commentable.comments.create!(body: params[:body], user_id: current_user.id)
		render json: {
			message: 'Comment created'
		}
	end

	private
	
	def load_commentable
		return 	@commentable = Answer.find(params[:answer_id])  if params[:answer_id] 
		@commentable = Post.find(params[:post_id])
	end

	def comment_params
		params.permit(:body)
	end

end