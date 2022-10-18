class CommunityEventsController < ApplicationController
    before_action :set_community_event, only: %i[ show_community_participants update destroy ]

def index
    @community_event = CommunityEvent.all
end

def create
token = request.headers["token"]
user_id = decode_token(token)
    if token
        new_community_event = CommunityEvent.create!(max_participant: params[:max_participant], min_participant: params[:min_participant] title: params[:title], start: params[:start], end: params[:end] user_id: user_id)
        render json: new_community_event
    else
        render json: {error: "Invalid Token"}, status: 404
    end
end

def update
    host = CommunityEvent.find_by!(user_id: params[:user_id])
    if
        host
    CommunityEvent.update(max_participant: params[:max_participant], min_participant: params[:min_participant], title: params[:title], start: params[:start], end: params[:end])
    render json: @community_event
    else
        render json: {error: "One or more fields are incorrect!"}, :unprocessable_entity
end

def show_community_participants
    host = CommunityEvent.find_by!(user_id: params[:user_id])
    if
        host
    @participants.find_all_by(params[:id])
    render json: @participants
        else
    render json: {error: "You are not the host, you cannot see all participants!"}, :not_authorized
    end
end

def destroy
    token = request.headers["token"]
    user_id = decode_token(token)
    host = CommunityEvent.find_by!(user_id: params[:user_id])
    if user_id = host
    @participant.destroy()
    else
        render json: {error: "You are not the host and cannot remove participants..."}, :not_authorized
    end
end


private

    def set_community_event
        @community_event = CommunityEvent.find(params[:id])
    end

end
