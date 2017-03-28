class Tag < ApplicationRecord
	belongs_to :category
	belongs_to :project
	validates :category, uniqueness: { scope: :project }
end
