class CommunityEventSerializer < ActiveModel::Serializer
  attributes :id, :max_participant, :min_participant, :start, :end, :title
end
