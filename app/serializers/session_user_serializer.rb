class SessionUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :auth_token
end
