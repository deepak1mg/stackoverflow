class Api::VotesController < ApplicationController
	before_action :set_comment

	def index
		render json: @comment.votes.all.to_json
	end

	def create
	end

	def upvote
		@vote=@comment.votes.build(params.permit(:upvote))
		vote_block
	end
	
	def downvote
		@vote=@comment.votes.build(params.permit(:downvote))
		vote_block
	end
	
	def destroy
		@vote=Votes.find(params[:id])
		@vote.destroy
		render json: {
			message: "successfully deleted"
		}
	end
	private

	  def set_comment
	  	puts params
	  	@comment=Comment.find_by(id: params[:comment_id])
	  end
	  def vote_block
	  	if @vote.save
			render json: {
				status: 200,
				message: 'vote successfully created',
				vote: @vote
			}.to_json
		else
			render json: {
				status: 501,
				message: 'Unable to create '
			}
		end 
	  end
	  def page_params
	  	puts params
	  	params.permit(:upvote, :downvote)
	  end
end