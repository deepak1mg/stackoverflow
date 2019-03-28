require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do

	describe 'in post' do
	
		let!(:count) do
			user = create(:user)
			post = create(:post)
			allow_any_instance_of(Api::PostsController).to receive(:current_user).and_return(user)
			# authdetail = create(:authdetail)
			# cookies[:auth_token]=authdetail.auth_token
		end
		
		it 'index should be able to get recent post ' do
			get :index
			expect(response.status).to eq 200
		end

		it 'create should be able to create post for valid users' do
			post :create, params:{
				post:{
					title: 'test title',
					body: 'test body'
				}
			}
			expect(response.status).to eq 200
		end

		it 'should be able to have upvote' do
			post :upvote, params:{ id: 2 } 
			 expect(response).to have_http_status(:ok)
		end
		it 'should count total votes' do
			get :count_votes, params:{ id: 2 }
			expect(response).to have_http_status(:ok)
		end
	end

end
