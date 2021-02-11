class LikeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :User
  has_one :Media
end
