class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :provider, :uid, :metadata, :token
end
