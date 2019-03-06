class Authdetail < ApplicationRecord
	enum status: [:active, :inactive]
	belongs_to :user
end
