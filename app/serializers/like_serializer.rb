class LikeSerializer < ActiveModel::Serializer
  attributes :id, :media
  has_one :User
  has_one :Media
end
