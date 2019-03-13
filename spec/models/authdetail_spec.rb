require 'rails_helper'

RSpec.describe Authdetail, type: :model do
  
  describe "#init" do
  	it "should be able to set status as active" do
  		auth = User.first.authdetails.create!(auth_token:'1234')
  		expect(auth.status).to eq "active"
  	end
  end

end
