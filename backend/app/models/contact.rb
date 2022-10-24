class Contact < ApplicationRecord
    belongs_to :user

    validates :phone_number, numericality: { only_integer: true }
    
end
