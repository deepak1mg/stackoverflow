class Post < ApplicationRecord
	acts_as_votable

	validates :title, :body, presence: true, length:{maximum: 80}
	
	has_many :answers
	has_many :comments, as: :commentable
	belongs_to :user
	

	default_scope -> {order(created_at: :desc)}

	def modify(body_text)
		update_attribute(:body, body_text)
	end
end
