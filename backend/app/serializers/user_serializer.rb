class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_email, :username, :image, :alias, :pronoun
  has_many :personal_events
  has_many :community_events
  has_many :contacts

end
