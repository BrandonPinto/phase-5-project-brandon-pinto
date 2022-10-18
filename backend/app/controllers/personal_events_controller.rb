class PersonalEventsController < ApplicationController
    before_action :set_personal_event, only: %i[ create show user_personal_events update destroy ]

def index
    @personal_events = PersonalEvent.all

    render json: @personal_events
end

def show
    render json: @personal_events
end
#find a single users personal_events
def user_personal_events
    user = User.find_by!(id: params[:id])
    render json: user
end

# POST to /personal_events
def create
    token = request.headers["token"]
    user_id = decode_token(token)
    if token
        new_event = PersonalEvent.create!(user_id: user_id )
        render json: new_event
    else
        render json: {error: "Invalid Token"},status: 404
    end
    end
end


def update
    token = request.headers["token"]
    user_id = decode_token(token)
    if user_id
        @personal_events.update()
        render json: @personal_events
    else
        render json: @personal_events.errors, status: :unprocessable_entity
    end
end

# DELETE /posts/1
def destroy
    token = request.headers["token"]
    user_id = decode_token(token)
    if user_id
    @personal_events.destroy
    end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_personal_event
    @personal_events = PersonalEvent.find(params[:id])
end

