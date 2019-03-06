class Answer < ApplicationRecord
	validates :answer, presence: true
	
	has_many :comments, as: :commentable
	belongs_to :post
	acts_as_votable
end
