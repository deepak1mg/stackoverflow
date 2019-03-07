class User < ApplicationRecord
	validates :email, :name, presence: true, uniqueness: true
	validates :password, presence: true

	has_many :posts, 		  dependent: :destroy
	has_many :badges,         dependent: :destroy 
	has_many :authdetails,    dependent: :destroy   
end
