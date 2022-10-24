class CommunityEventsController < ApplicationController
    before_action :authorized, only: [ :index, :create, :show, :update, :destroy ]
    before_action :set_community_event, only: [:remove_participant, :show_event_participants]

def index
    @community_events = CommunityEvent.all
    render json: @community_events
end

def show
    render json: @current_user
end

def create
token = request.headers["token"]
user_id = decode_token(token)
    if user_id
        new_community_event = CommunityEvent.create!(max_participant: params[:max_participant], min_participant: params[:min_participant], title: params[:title], start: params[:start], end: params[:end], user_id: user_id)
        render json: {community_event: new_community_event}
    else
        render json: {error: "Invalid Token"}, status: 404
    end
end

def update
token = request.headers["token"]
current_user = decode_token(token)
event = CommunityEvent.find_by(id: params[:id])
host = event.user_id
    if host == current_user
    updated_event = CommunityEvent.update(community_event_params)
        render json: updated_event
    else
        render json: {error: "You are not the host, please ask the host to apply any changes you're requesting!"}, status: :unauthorized
    end
        
end

def show_event_participants
token = request.headers["token"]
current_user = decode_token(token)
host = @community_event.user_id
    if host == current_user
        all_participants = Participant.where(community_event_id: params[:community_event_id])
        render json: all_participants
    else
        render json: {error: "You are not the host and cannot see all participants, sorry!"}
    end
end

def remove_participant
token = request.headers["token"]
current_user = decode_token(token)
puts current_user
host = @community_event.user_id
puts host
    if host == current_user
    person_to_remove = Participant.find_by(user_id: params[:user_id])
    puts person_to_remove
    person_to_remove.destroy
    else
        render json: {error: "You are not the host."}, status: :unauthorized
    end
end

def destroy
token = request.headers["token"]
current_user = decode_token(token)
puts current_user
event = CommunityEvent.find_by(id: params[:id])
puts event
host = event.user_id
    if host == current_user
    event.destroy
    else
        render json: {error: "You are not the host and cannot delete this event!"}, status: :unauthorized
    end 
end



private
def community_event_params
    params.permit(:max_participant, :min_participant, :title, :start, :end)
end

def set_community_event
    @community_event = CommunityEvent.find_by!(id: params[:id])
end

end
