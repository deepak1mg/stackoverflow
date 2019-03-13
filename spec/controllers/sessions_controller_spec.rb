require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
	describe '#create' do
		it 'should be able login' do
			post :create, params: {
				email: 'stackflow@gmail.com',
				password: '1234567'
			}
			expect(response).to be_success
		end
	end
end
