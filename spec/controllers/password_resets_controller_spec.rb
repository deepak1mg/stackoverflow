require 'rails_helper'

RSpec.describe Api::PasswordResetsController, type: :controller do

	describe 'password reset' do
		
		it 'create should render password reset link' do
			user = create(:user)
			post :create, params:{
				email: 'john@gmail.com'
			}
			expect(response.body.nil?).to eq false
		end
	end
end