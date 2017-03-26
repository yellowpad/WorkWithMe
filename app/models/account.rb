class Account < ApplicationRecord
  has_secure_password
  
  has_many :projects
  has_many :comments, through: :projects

end
