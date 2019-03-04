class Api::VotesController < ApplicationController
	before_action :set_comment

	def index
		render json: {
			upvote: @comment.upvotes.all,
			downvote: @comment.downvotes.all
		}.to_json
	end

	def create
	end

	def upvote
		vote = @comment.upvotes.create!(user_id: auth.user_id)
      	render plain: "upvote created"
	end
	
	def downvote
		vote = @comment.downvotes.create!(user_id: auth.user_id)
      	render plain: "downvote created"
	end

	private

	  def set_comment
	  	@comment = Comment.find(params[:comment_id])
	  end

end