class LikeSerializer < ActiveModel::Serializer
  attributes :id,:likeable_type,:likeable_id
end
