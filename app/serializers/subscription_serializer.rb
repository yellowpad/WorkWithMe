class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :category
  belongs_to :account
end
