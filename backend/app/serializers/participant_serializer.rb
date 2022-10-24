class ParticipantSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :community_event_id
  
end
