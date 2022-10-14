class User < ApplicationRecord
    has_one :calendar, dependant: :destroy
    has_many :appointments
    has_many :events, through: :appointments
end
