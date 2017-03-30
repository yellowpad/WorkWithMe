class LikeSerializer < ActiveModel::Serializer
  attributes :id, :heart, :liker
  belongs_to :project

  def liker
    object.account.username
  end
end
