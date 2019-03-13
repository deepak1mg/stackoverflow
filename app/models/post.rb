class Post < ApplicationRecord
	validates :title, :body, presence: true, length:{maximum: 80}
	has_many :answers
	has_many :comments, as: :commentable
	belongs_to :user
	acts_as_votable
end
