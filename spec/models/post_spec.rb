require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe 'validation test' do
  	it 'should validate post model' do
  		post = Post.new(title:"aa"*90,body:'saas')
  		expect(post.save).to eq false
  	end
  end
end
