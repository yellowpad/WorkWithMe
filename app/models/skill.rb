class Skill < ApplicationRecord
  has_many :requirements #project requirements
  has_many :projects, through: :requirements #projects that require this skill

  validates :name, uniqueness: true
end
