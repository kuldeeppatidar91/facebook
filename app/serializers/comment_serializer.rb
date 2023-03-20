class CommentSerializer < ActiveModel::Serializer
  attributes :id,:text,:commentable_type,:commentable_id

  attribute :user_name do |object|
    object.object.user.first_name
  end
end
