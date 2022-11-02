class AllEventsSerializer < ActiveModel::Serializer
 attributes :id, :title, :start, :end

#  has_many :community_events do 
#   object.community_events.order(:start)
# end

# has_many :personal_events do
#   object.personal_events.order(:start)
# end

# :user do
#   object.community_events.start
# end

end
