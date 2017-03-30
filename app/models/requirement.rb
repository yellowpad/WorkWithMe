class Requirement < ApplicationRecord
  belongs_to :project
  belongs_to :skill

  validates :skill, uniqueness: {scope: :project}
end
