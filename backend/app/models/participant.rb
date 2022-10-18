class Participant < ApplicationRecord
    belongs_to :community_event
    belongs_to :user
end
