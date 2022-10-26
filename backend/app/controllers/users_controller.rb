class UsersController < ApplicationController
before_action :authorized, only: [ :update]


def index
  users = User.all
  render json: users
end

def show

  render json: @current_user
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
  token = JWT.encode({user_id: @user.id}, 'token')
  render json: {user: @user, token: token}
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
