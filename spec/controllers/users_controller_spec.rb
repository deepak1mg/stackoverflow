require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

	describe 'user creation' do
		it 'should generate user' do
			post :create, params: {
				user:{ name:'qwe23',
				email: 'qwe@gmail.com',
				password: '123456'}
			}
			expect(response).to be_success
		end
	end

end
