class User < ApplicationRecord

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, length: {maximum: 20}
	validates :name, presence: true
	validates :password, length: {in: 6..14}

	has_many :posts, 		  dependent: :destroy
	has_many :badges,         dependent: :destroy 
	has_many :authdetails,    dependent: :destroy   

	before_validation :init

	def init
		self.email = email.downcase
	end
end
