class CommunityEventsController < ApplicationController
    before_action :authorized, only: [ :create, :show, :update, :destroy ]

def index
    @community_events = CommunityEvent.all
    render json: @community_events
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
user_id = decode_token(token)
event = CommunityEvent.find_by(id: params[:id])
    host = event.user_id
        if host == user_id
        updated_event = CommunityEvent.update(title: params[:title], start: params[:start], end: params[:end])
            render json: updated_event
        end
            
end


def destroy
token = request.headers["token"]
user_id = decode_token(token)
event = CommunityEvent.find_by(id: params[:id])
    host = event.user_id
        if host == user_id
        CommunityEvent.destroy()
        prompt("You have deleted this event.")
        end
            
end



private




end

def set_community_event
    @community_event = CommunityEvent.find(params[:id])
end

end
