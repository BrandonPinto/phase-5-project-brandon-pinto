class UserSerializer < ActiveModel::Serializer
  attributes :id, :calendar_id, :email, :username, :password, :image, :alias, :pronoun
end
