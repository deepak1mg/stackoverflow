class User < ApplicationRecord
	has_many :posts ,         dependent: :destroy
	has_many :badges,         dependent: :destroy 
	has_many :authdetails,    dependent: :destroy   

	validates :email, presence: true, uniqueness: true
end
