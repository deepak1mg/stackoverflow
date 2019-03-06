class Api::AnswersController < ApplicationController
	
	before_action :set_post
	before_action :set_answer, only: [:destroy, :upvote, :downvote]
	before_action :current_user, only: [:create, :upvote, :downvote]


	def index
		render json: @post.answers.paginate(page: params[:page]).to_json
	end

	def create
		answer = @post.answers.create!(answer_params)
		render json: {
			status: 200,
			message: 'Successfully answer created'
		}.to_json
	end
	
	def count_votes
		render json:{downvote: @answer.get_downvotes.size,
			upvote: @answer.get_upvotes.size}
	end

	def destroy
		@answer.destroy!
		render json: {
			message: "successfully deleted"
		}
	end

	def upvote
		@answer.upvote_by current_user
		render json:{ message: "upvote created"} 
	end

	def downvote
		@answer.downvote_by current_user
		render json:{ message: "upvote created"} 
	end

	private

	  def set_post
	  	@post = Post.find(params[:post_id])
	  end

	  def set_answer
	  	@answer = Answer.find(params[:id])
	  end

	  def answer_params
	  	params.require(:answer).permit(:answer)
	  end

end