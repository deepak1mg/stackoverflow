require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "validation tests" do
    # let(:user) {    }
  	it 'should not validate with duplicate email' do
  		User.create!(email:'rails2321@gmail.com',name:'asada',password:'passss')
  		user=User.new(email:'rails2321@gmail.com',name:'as121',password:'pass').save
  		expect(user).to eq false
  	end

  	it 'should enter valid email' do
  		user=User.new(email:'duplicate_email',name:'as',password:'pass').save
  		expect(user).to eq false
  	end
  end

end
