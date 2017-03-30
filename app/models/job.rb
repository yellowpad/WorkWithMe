class Job < ApplicationRecord
	belongs_to :project

	validates :bounty, numericality: {in: 9..20}
end
