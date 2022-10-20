class PersonalEventsController < ApplicationController
    before_action :set_personal_event, only: %i[ show update destroy]
    before_action :authorized, only: [ :create, :show, :update, :destroy]

def index
    events = PersonalEvent.all
    render json: events.user_id
end

def show
    render json: {user_id: @personal_event}
end
#find a single users personal_events
def user_personal_events

    render json: {Personal_Events: @current_user}
end

# POST to /personal_events
def create
token = request.headers['token']
user_id = decode_token(token)
puts user_id
    if user_id
        new_event = PersonalEvent.create!(title: params[:title], start: params[:start], end: params[:end], user_id:user_id)
        puts user_id
        render json: new_event
    else
        render json: {error: "One or more fields are incorrect."},status: :unprocessable_entity
    end
end


# def update
# token = request.headers["token"]
# user_id = decode_token(token)
#     if user_id
#         @personal_event.update()
#         render json: @personal_event
#     else
#         render json: @personal_event.errors, status: :unprocessable_entity
#     end
# end

# DELETE a /personal_event
def destroy
    token = request.headers["token"]
    user_id = decode_token(token)
    if user_id
    @personal_event.destroy
    end
end

private

# Use callbacks to share common setup or constraints between actions.
def set_personal_event
    token = request.headers["token"]
    user_id = decode_token(token)
    @personal_event = PersonalEvent.find(params[:id])
end
end
