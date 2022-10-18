class CommunityEvent < ApplicationRecord
belongs_to :user
has_many :participants
end
