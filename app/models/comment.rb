class Comment < ApplicationRecord
	belongs_to :post
	has_many :upvotes
	has_many :downvotes
	validates :answer, presence: true
end
