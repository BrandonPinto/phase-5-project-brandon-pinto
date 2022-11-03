class CommunityEventSerializer < ActiveModel::Serializer
  attributes :title, :id, :user_id, :max_participant, :min_participant, :start, :end
  
end
