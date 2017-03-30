class Brainsmart < ApplicationRecord
  belongs_to :account
  belongs_to :skill

  validates :skill, uniqueness: {scope: :account}
end
