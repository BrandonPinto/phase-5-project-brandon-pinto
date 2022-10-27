class UsersController < ApplicationController
before_action :authorized, only: [ :show, :update]


def index
  users = User.all
  render json: users
end

def show

  render json: [@current_user]
end


# def all_events
# token = request.headers["token"]
# user = decode_token(token)
# temp_array = []

# p_events = PersonalEvent.find_by!(user_id: user)
# c_events = Participant.find_by!(user_id: user)
# temp_array.push(p_events)
# temp_array.push(c_events)

# render json: temp_array



# end

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
