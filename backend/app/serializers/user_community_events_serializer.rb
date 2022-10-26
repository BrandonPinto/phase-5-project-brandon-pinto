class UserCommunityEventsSerializer < ActiveModel::Serializer
  attributes :id, :user_email, :username, :image, :alias, :pronoun


  has_many :community_events do 
    object.community_events.order(:start)
  end

  has_many :personal_events do
    object.personal_events.order(:start)
  end

end
