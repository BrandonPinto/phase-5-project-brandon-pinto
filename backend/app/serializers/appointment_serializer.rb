class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :gift_name, :gift_price
end
