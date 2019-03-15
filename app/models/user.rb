class User < ApplicationRecord

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, length: {maximum: 20}
	validates :name, presence: true
	validates :password, length: {in: 6..14}

	has_many :posts, 		  dependent: :destroy
	has_many :badges,         dependent: :destroy 
	has_many :authdetails,    dependent: :destroy   

	before_validation :init

	attr_accessor :sent_at

	# attr_accessor :remember_token

	def init
		self.email = email.downcase
	end

	def send_password_reset_request
		user.authdetails.create!(auth_token: SecureRandom.uuid)
		
	end

	# def self.digest(message)
 #    	Digest::SHA256.hexdigest(message)[0..20]
 #  	end

 #  	def self.new_token
 #    	SecureRandom.urlsafe_base64
 #  	end

 #  	def remember
 #  		self.remember_token = User.new_token
 #  		update_attribute(:remember_digest, User.digest(remember_token)) 
 #  		cookie_remember
 #  	end

end
