require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do

	describe 'in comments' do
		let!(:count) do
			user = create(:user)
			post = create(:post)
			answer = create(:answer)
			allow_any_instance_of(Api::CommentsController).to receive(:current_user).and_return(user)
		end
		before(:each) do
			
		end

		it 'should be able to make comments for post' do
			post :comment_for_post, params: {
				id: 2,
				user_id: 1,
				body: 'test comment'
			}
			expect(response.status).to eq 200
		end

		it 'should be able to get comments for post' do
			get :post_comments, params: {id: 2}
			expect(response.body.nil?).to eq false
		end

	
		# it 'should be able to make comments for answer' do
		# 	post :comment_for_answer, params: {
		# 		id: 1,
		# 		user_id: 1,
		# 		body: 'test comment'
		# 	}
		# 	expect(response.status).to eq 200
		# end
	end

end
