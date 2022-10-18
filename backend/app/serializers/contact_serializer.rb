class ContactSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :company, :phone_number, :location, :notes
end
