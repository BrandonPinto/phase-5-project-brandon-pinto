class Calendar < ApplicationRecord
    belongs_to :user, dependant: :destroy
    has_many :users
    has_many :appointments, through: :users
end
