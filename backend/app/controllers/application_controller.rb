class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    before_action :authorized
    


def logged_in_user
    headers = request.headers['token']
    if(headers)
        token = headers
        current_id = JWT.decode(token, 'token', true, algorithm: 'HS256')
        @current_user = User.find(current_id[0]["user_id"])
        puts "hi current"
        puts @current_user
        @current_user
    end
end

def authorized
    puts "checking... #{logged_in_user}"
    render json: { message: 'Please log in' }, status: :unauthorized unless !!logged_in_user
end

def decode_token(token)
    JWT.decode(token, secret_key)[0]["user_id"]
end

private

def render_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
end

def render_not_found(error)
    render json: {errors: {error.model => "Not Found"}}, status: :not_found
end
def deny_access
    head :forbidden
end
def secret_key
    "token"
end

end