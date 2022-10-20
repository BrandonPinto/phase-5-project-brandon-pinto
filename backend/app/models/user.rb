class User < ApplicationRecord
    has_many :personal_events
    has_many :contacts
    has_many :participants
    has_many :community_events, through: :participants

    has_secure_password

    validates :username, uniqueness: true, presence: true
    validates :password_digest, uniqueness: true,  presence: true
    validates :email, uniqueness: true, presence: true


end
