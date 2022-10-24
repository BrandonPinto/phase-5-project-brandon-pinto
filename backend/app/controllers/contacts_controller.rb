class ContactsController < ApplicationController
    before_action :authorized, only: [ :index, :create, :show, :update, :destroy ]
    before_action :set_contact, only: %i[ update show destroy ]

def index
    @contacts = Contact.all
    render json: @contacts
end

def show
    render json: @current_user
end

def create
token = request.headers["token"]
user_id = decode_token(token)
    if user_id
        new_contact = Contact.create!(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], company: params[:company], phone_number: params[:phone_number], location: params[:location], notes: params[:notes])
        render json: new_contact
    else
        render json: {error: "One or more fields are incorrect"}, status: :unprocessable_entity
    end
end

def update
    if @current_user
        @contact.update!(contact_params)
        render json: @contact
    else
        render json: {error: "Information may be invalid or incorrect."}, status: :unprocessable_entity
    end
        
end

def destroy
token = request.headers["token"]
user_id = decode_token(token)
    if user_id
    @contact.destroy
    end
end

private

def contact_params
    params.permit(:first_name, :last_name, :company, :email, :phone_number, :location, :notes)
end

def set_contact
token = request.headers["token"]
user_id = decode_token(token)
    @contact = Contact.find(params[:id])
end


end
