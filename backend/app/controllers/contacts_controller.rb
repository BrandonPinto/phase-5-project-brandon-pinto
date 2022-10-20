class ContactsController < ApplicationController
    before_action :authorized, only: [ :create, :show, :update, :destroy ]
    before_action :set_contact, only: %i[ show destroy update ]

def index
    @contacts = Contact.all
    render json: @contacts
end

def create
token = request.headers["token"]
user_id = decode_token(token)
    if user_id
        new_contact = Contact.create!(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], company: params[:company], phone_number: params[:phone_number], location: params[:location], notes: params[:notes], user_id: user_id)
        render json: new_contact
    else
        render json: {error: "One or more fields are incorrect"}, status: :unprocessable_entity
    end
end

def update
token = request.headers["token"]
user_id = decode_token(token)
    if user_id
        Contact.update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], company: params[:company], phone_number: params[:phone_number], location: params[:location], notes: params[:notes])
        render json: @contact
    else
        render json: @contact.errors, status: :unprocessable_entity
    end
end


def show
    render json: @contact
end

def destroy
token = request.headers["token"]
user_id = decode_token(token)
    if user_id
    @contact.destroy
    end
end

private

def set_contact
    @contact = Contact.find(params[:id])
end


end
