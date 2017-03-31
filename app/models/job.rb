class Job < ApplicationRecord
	belongs_to :project

	validates :bounty, inclusion: {in: 9..20}
end
