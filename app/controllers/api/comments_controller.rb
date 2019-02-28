class Api::CommentsController < ApplicationController
	before_action :set_post

	def index
		render json: @post.comments.all.to_json
	end

	def show
		render json: Comment.all.to_json
	end
	

	def create
		@comment=@post.comments.build(page_params)
		if @comment.save
			render json: {
				status: 200,
				message: 'vote successfully created',
				comment: @comment
			}.to_json
		else
			render json: {
				status: 501,
				message: 'Unable to create '
			}
		end 
	end
	def destroy
		@comment=Comment.find(params[:id])
		@comment.destroy
		render json: {
			message: "successfully deleted"
		}
	end
	private

	  def set_post
	  	puts params
	  	@post=Post.find_by(id: params[:post_id])

	  end

	  def page_params
	  	puts params
	  	params.permit(:answer)
	  end
end