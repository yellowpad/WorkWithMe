class Like < ApplicationRecord
  belongs_to :account
  belongs_to :project

  validates :project, uniqueness: {scope: :account}
  validates :heart, inclusion: {in: -1..1}
end
