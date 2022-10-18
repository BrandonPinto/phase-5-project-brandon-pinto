class User < ApplicationRecord
    has_many :personal_events
    has_many :contacts
    has_many :participants
    has_many :community_events, through: :participants

    has_secure_password


end
