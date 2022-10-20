class ParticipantsController < ApplicationController
    before_action :authorized, only: [:create]
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
    event = CommunityEvent.find(params[:id])
    host_id =  event.user_id
    # host = CommunityEvent.find_by(user_id: params[:user_id])

    puts host
    if user_id != host_id
        join_event = Participant.create!(user_id: user_id, community_event_id: community_event_id)
        render json: join_event
    end

end
  
# def destroy
# token = request.headers['token']
# user_id = decode_token(token)


# end

private


def find_event
    @event = CommunityEvent.find(params[:id])
end

end
