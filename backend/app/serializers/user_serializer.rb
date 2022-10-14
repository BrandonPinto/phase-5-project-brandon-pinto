class UserSerializer < ActiveModel::Serializer
  attributes :id, :calendar_id, :email, :username, :image, :alias, :pronoun
end
