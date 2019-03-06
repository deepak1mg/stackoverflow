class Badge < ApplicationRecord
	enum badge_type: [:beginner, :intermediate, :advanced]
	belongs_to :user
end
