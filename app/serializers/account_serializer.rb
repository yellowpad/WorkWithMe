class AccountSerializer < ActiveModel::Serializer
  attributes :id, :subscription_count

  def subscription_count
    object.subscriptions.count
  end
end
