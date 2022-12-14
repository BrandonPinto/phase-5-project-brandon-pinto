class PersonalEventsController < ApplicationController
    before_action :set_personal_event, only: %i[ show destroy ]
    before_action :authorized, only: [:show, :create, :update, :destroy]

def index
    events = PersonalEvent.all
    render json: events
end

def show
    render json: @current_user
end


# POST to /personal_events
def create
token = request.headers['token']
user_id = decode_token(token)
    if user_id
        new_event = PersonalEvent.create!(title: params[:title], start: params[:start], end: params[:end], user_id: user_id)
        puts new_event
        render json: new_event
    else
        render json: {error: "One or more fields are incorrect."}, status: :unprocessable_entity
    end
end


def update
token = request.headers["token"]
user_id = decode_token(token)
event = PersonalEvent.find(params[:id])
puts user_id
puts event
    if user_id
        event.update!(personal_event_params)
        render json: event
    else
        render json: {error: "Not authorized or input fields are incorrect."}, status: :unprocessable_entity
    end
end

# DELETE a /personal_event
def destroy
token = request.headers["token"]
user_id = decode_token(token)
    if user_id
    @destroy_event.destroy
    end
end

private

# Use callbacks to share common setup or constraints between actions.
def set_personal_event
    @personal_event = PersonalEvent.find(params[:id])
end

def personal_event_params
    params.permit(:title, :start, :end)
end

end
