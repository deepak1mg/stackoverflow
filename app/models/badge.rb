class Badge < ApplicationRecord
	enum badge_type: {
		beginner: 'beginner',
		advance: 'advance',
		intermediate: 'intermediate'
	}
	belongs_to :user
	validates :badgetype, presence: true
end
