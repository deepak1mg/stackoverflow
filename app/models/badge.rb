class Badge < ApplicationRecord
	enum badge_type: [:beginner, :intermediate, :advanced]
	belongs_to :user
	before_validation :init

	def init
		self.badge_type = "beginner"
	end 
end
