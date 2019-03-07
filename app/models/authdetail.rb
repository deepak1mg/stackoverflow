class Authdetail < ApplicationRecord
	enum status: [:active, :inactive]

	belongs_to :user

	before_validation :init

	def init
		self.status ||= :active
	end
end
