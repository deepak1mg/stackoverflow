class User < ApplicationRecord
	has_many :posts ,         dependent: :destroy
	has_many :badges,         dependent: :destroy 
	has_many :authdetails,    dependent: :destroy   
	has_many :comments
	has_many :upvotes
	has_many :downvotes
	validates :email, :name, presence: true, uniqueness: true
	validates :password, presence: true
end
