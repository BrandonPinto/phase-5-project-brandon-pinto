class UsersController < ApplicationController
before_action :authorized, only: [ :all_events, :show, :update]


def index
  users = User.all
  render json: users
end

def show

  render json: [@current_user]
end


def all_events
  token = request.headers["token"]
  user = decode_token(token)
  current_user = User.find(user)
  if current_user
  p_events = PersonalEvent.where(user_id: user)
  p_events_redone = current_user.personal_events.as_json(only: %i{title start end})
  c_events = current_user.community_events.as_json(only: %i{title start end})

  render json: p_events_redone + c_events
  end
end

def login #for /login
  #find by username from body
  @user = User.find_by(username: params[:username])
  #check if user exists and password matches password digest
  if (@user && @user.authenticate(params[:password]))
      #create token for front end
      token = JWT.encode({user_id: @user.id}, 'token')
      #pass user instance and token to front end
      render json: {user: @user, token: token}
  else
    render json: {error: "incorrect login info, or user is not found.."}
  end 
end

def create #for /signup
  @user = User.create!(username: params[:username], user_email: params[:user_email], password: params[:password])
  render json: @user
end 

def update
@current_user.update(user_params)
render json: @current_user
end

private

def user_params
  params.permit(:image, :alias, :pronoun)
end

end
