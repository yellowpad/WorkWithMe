class Category < ApplicationRecord
	has_many :tags #project tags
	has_many :projects, through: :tags #projects that are in this category

	validates :name, uniqueness: true
end
