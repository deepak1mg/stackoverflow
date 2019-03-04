class Api::CommentsController < ApplicationController
	before_action :set_post

	def index
		render json: @post.comments.paginate(page: params[:page], per_page: 10).to_json
	end

	def create
		comment = @post.comments.create!(page_params)
		render json: {
			status: 200,
			message: 'Successfully comment created'
		}.to_json
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		render json: {
			message: "successfully deleted"
		}
	end
	private

	  def set_post
	  	@post = Post.find_by(id: params[:post_id])
	  end

	  def page_params
	  	params.require(:comment).permit(:answer)
	  end
end