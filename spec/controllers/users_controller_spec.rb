require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

	describe 'user creation' do
		it 'should generate user' do
			post :create, params: {
				user:{ name:'qwe2312',
				email: 'qwe12@gmail.com',
				password: '123456'}
			}
			expect(response).to be_success
		end
	end

end
