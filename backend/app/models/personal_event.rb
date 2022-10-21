class PersonalEvent < ApplicationRecord
    belongs_to :user

    # self.attributes = attributes

# def update_attributes(attributes)
#     if attributes.title = "" || attributes.start = "" || attributes.end = ""
#         self.save(false)
#     else
#         self.save(true)

#     end


end
