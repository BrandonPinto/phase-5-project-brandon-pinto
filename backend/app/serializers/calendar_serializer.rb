class CalendarSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :end, :appointment_id
end
