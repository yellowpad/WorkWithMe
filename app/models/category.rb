class Category < ApplicationRecord
	has_many :tags
	has_many :projects, through: :tags

	validates :name, uniqueness: true
end
