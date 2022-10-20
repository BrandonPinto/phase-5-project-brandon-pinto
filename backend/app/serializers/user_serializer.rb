class UserSerializer < ActiveModel::Serializer
  attributes :id, :personal_event_id, :contact_id, :email, :username, :image, :alias, :pronoun
  has_many :contacts
  has_many :personal_events
end
