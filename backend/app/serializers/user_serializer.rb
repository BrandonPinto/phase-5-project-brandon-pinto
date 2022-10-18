class UserSerializer < ActiveModel::Serializer
  attributes :id, :personal_event_id, :contact_id, :email, :username, :password, :image, :alias, :pronoun
end
