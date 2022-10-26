class ContactSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :company, :phone_number, :address, :notes
  belongs_to :user
end
