class ParticipantsController < ApplicationController
    before_action :authorized, only: [:create]
    before_action :find_event, only: [:destroy]
def index
    @participants = Participant.all
    render json: @participants
end

def create
    #getting token
    token = request.headers['token']
    #finding user id 
    user_id = decode_token(token)
    #is the current user the host of the event
    event = CommunityEvent.find(params[:community_event_id])
    
    host_id =  event.user_id
    # host = CommunityEvent.find_by(user_id: params[:user_id])

    puts host_id
    if user_id != host_id
        join_event = Participant.create!(user_id: user_id, community_event_id: event.id)
        render json: join_event
    else
        render json: {error: "You are the host! You cannot join your own event. You may view it in the events tab."}
    end

end
  
def destroy
token = request.headers['token']
user_id = decode_token(token)
    if user_id
        @event.destroy
    else
        render json: {error: "User or Event not found."}, status: :not_found
    end

end

private


def find_event
    @event = CommunityEvent.find(params[:id])
end

end
