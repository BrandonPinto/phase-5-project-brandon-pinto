class PersonalEventSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :end
end
