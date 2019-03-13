require 'rails_helper'

RSpec.describe Badge, type: :model do
  
  describe "#init" do
  	it 'should initailize badge type of user' do
  		badge=User.last.badges.create!
  		expect(badge.badge_type).to eq "beginner"
  	end
  end

end
