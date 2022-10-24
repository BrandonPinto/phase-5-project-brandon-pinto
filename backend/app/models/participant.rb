class Participant < ApplicationRecord
    belongs_to :community_event
    belongs_to :user


    validates :user_id, uniqueness: {scope: :community_event_id, message: "You may not join the same event twice!"}
end
