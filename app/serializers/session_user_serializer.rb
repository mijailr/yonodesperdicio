class SessionUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :auth_token, :created_at, :updated_at
end
