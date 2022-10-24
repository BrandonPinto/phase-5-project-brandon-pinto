class User < ApplicationRecord
    has_many :personal_events
    has_many :contacts
    has_many :participants
    has_many :community_events, through: :participants
    #This is to check for the @ symbol, the prefix, and the domain.

    #this is for the bcrypt gem to encrypt passwords.
    has_secure_password
    #all validations required for user signup and login.
    validates :password_digest, presence: true
    validates :username, uniqueness: true, presence: true
    validates :username, length: { minimum: 5 }
    validates :username, length: { maximum: 15 }
    validates :password, length: { minimum: 7 }
    validates :password, length: { maximum: 25 }
    validates :user_email, uniqueness: true, presence: true, confirmation: { case_sensitive: true }
    validates :user_email, email: true

    


end
