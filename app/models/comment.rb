class Comment < ApplicationRecord
	belongs_to :post
	has_many :votes
end
