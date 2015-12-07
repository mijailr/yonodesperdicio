class UserSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :username, :zipcode, :created_at, :updated_at
end
