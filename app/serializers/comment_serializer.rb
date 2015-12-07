class CommentSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :body, :created_at, :updated_at
  has_one :user
end
