class CommunityEvent < ApplicationRecord
belongs_to :user
has_many :participants, dependent: :destroy

    validates :min_participant, :max_participant, presence: true
    validates :title, presence: true
    validates :start, presence: true
    validates :end, presence: true
    validates :min_participant, numericality: { greater_than: 0 }
    validates :min_participant, numericality: { only_integer: true }
    validates :max_participant, numericality: { only_integer: true }
    validates :max_participant, comparison: { greater_than: :min_participant}

end