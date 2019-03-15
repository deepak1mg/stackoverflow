require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do

	describe 'in index' do
		it 'should be able to get recent post ' do
			get :index
			expect(response.status).to eq 200
		end
	end

	describe 'in create' do
		it 'should be able to create post for valid users' do
			post :create, params:{
				post:{
					title: 'test title',
					body: 'test body',
					user_id: 10
				}
			}
			debugger
		end
	end

end
