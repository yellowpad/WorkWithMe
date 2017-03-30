class Project < ApplicationRecord
  has_many :comments
  belongs_to :account

  has_many :tags
  has_many :categories, through: :tags

  has_many :requirements
  has_many :skills, through: :requirements

  has_many :likes
  has_many :likers, through: :likes, source: :account
end
