require 'rails_helper'

RSpec.describe Badge, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:badge) { FactoryBot.create(:badge, user: user) }

  describe "#init" do
  	it 'should initailize badge type of user' do
  		expect(badge.badge_type).to eq 'beginner'
  	end
  end

end
