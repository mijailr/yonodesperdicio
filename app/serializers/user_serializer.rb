class UserSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :username, :zipcode, :total_quantity, :rating, :created_at
end
