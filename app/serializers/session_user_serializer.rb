class SessionUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :total_quantity, :rating, :email, :auth_token, :created_at
end
