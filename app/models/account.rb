class Account < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :comments, through: :projects

  has_many :subscriptions
  has_many :categories, through: :subscriptions
  #has_many :subscribed_tags, through: :categories, source: :tags
  has_many :newsfeed_projects, through: :categories, source: :projects

end
