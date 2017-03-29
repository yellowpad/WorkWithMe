class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :category

  validates :category, uniqueness: { scope: :account }
end
