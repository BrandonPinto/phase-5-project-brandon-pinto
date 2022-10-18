class CommunityEventSerializer < ActiveModel::Serializer
  attributes :id, :name_of_event, :max_participant, :min_particpant, :start, :end
end
