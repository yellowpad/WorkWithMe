class Project < ApplicationRecord
  has_many :comments
  belongs_to :account

  has_many :tags
  has_many :categories, through: :tags

  has_many :requirements
  has_many :skills, through: :requirements
end
