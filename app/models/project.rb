class Project < ApplicationRecord
  has_many :comments
  belongs_to :account
end
