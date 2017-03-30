class Account < ApplicationRecord
  has_secure_password

  has_many :projects #user created project
  has_many :comments, through: :projects

  has_many :subscriptions #account to category join
  has_many :interests, through: :subscriptions, source: :category
  has_many :newsfeed_projects, through: :interests, source: :projects #projects that show up on interests newsfeed

  has_many :brainsmarts #qualifications
  has_many :skills, through: :brainsmarts
  has_many :qualified_projects, through: :skills, source: :projects #projects that show up on qualified

end
