class UsersController < ApplicationController
  
    before_action :set_user, only: %i[ show update destroy ]  
  def index
    @users = User.all
  
    render json: @users
  end
  
  def show
    render json: @user
  end
  
  def login
    user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if user
      token = generate_token(user.id)
      render json: {user:user, token:token}
    else
      render json: {error:"wrong login info"}, status: 401
    end
  end
  
  def profile
    token = request.headers["token"]
    user_id = decode_token(token)
    if user_id
      render json: User.find(user_id)
    else
      render json: {error: "401 incorrect token"}, status: 401
    end
  end
  
  def create
    user = User.create!(username: params[:username], email: params[:email], password: params[:password])
    render json: user
  end
  
  def update
    @user.update(username: params[:username], password: params[:password])
    render json: @user
  end
  
  def destroy
    @user.destroy
    render json: @user  
  end
  
  private
    def set_user
      token = request.headers["token"]
      puts token
      user_id = decode_token(token)
      puts 'hello'
      puts user_id
      @user = User.find_by(id: user_id)
    # Find a User
    end
  
    def user_params
      params.require(:username).permit(:email, :password_digest)
    end
  
  end