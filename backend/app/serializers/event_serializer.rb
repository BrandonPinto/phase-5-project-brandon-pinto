class EventSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :event_number, :name_of_event, :min_participant, :max_participant, :date, :time
end
