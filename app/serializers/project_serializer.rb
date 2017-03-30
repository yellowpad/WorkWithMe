class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :total_likes

  has_many :comments
  has_many :likes

  def total_likes
    object.likes.sum(:heart)
  end
end
