require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
	describe '#create' do
		it 'should be able login' do
			user = create(:user)
			post :create, params: {
				email: 'john@gmail.com',
				password: 'secret'
			}
			expect(response).to be_success
		end
	end
end
