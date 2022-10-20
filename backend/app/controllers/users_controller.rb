class UsersController < ApplicationController

before_action :authorized, only: [:show]

def index
  users = User.all
  render json: users
end

def show
  render json: {user: @current_user}
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
  end 
end

def create #for /signup
  @user = User.create!(username: params[:username], email: params[:email], password: params[:password], image: params[:image], alias: params[:alias], pronoun: params[:pronoun])
  token = JWT.encode({user_id: @user.id}, 'token')
  render json: {user: @user, token: token}
end 

def update
  @user.update!(user_params)
  render json: @user
end

private

def set_user
  @user = @current_user
end

def user_params
  params.require(:user).permit(:email, :password_digest)
end

end
